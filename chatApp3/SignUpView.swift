//
//  SignUpView.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/5/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    let emailField: UITextField
    let passwordField: UITextField

    init() {
        emailField = UITextField()
        passwordField = UITextField()
        super.init(frame: .zero)
        self.addSubview(emailField)
        self.addSubview(passwordField)
        self.backgroundColor = UIColor(hex: 0x3d3d3d)
        emailField.delegate = self
        passwordField.delegate = self
        formatEmailField()
        formatPasswordField()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func formatEmailField() {
        emailField.layer.cornerRadius = 25
        emailField.layer.borderColor = UIColor.white.cgColor
        emailField.layer.borderWidth = 1
        emailField.setLeftPaddingPoints(15)
    }
    
    private func formatPasswordField() {
        passwordField.layer.cornerRadius = 25
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor.white.cgColor
        passwordField.setLeftPaddingPoints(15)
    }
    
    private func setupConstraints() {
        emailField.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(50)
        }
        
        passwordField.snp.remakeConstraints { (make) in
            make.top.equalTo(emailField.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(50)
        }
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension SignUpView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
