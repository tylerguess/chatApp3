//
//  SignUpView.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/5/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    let emailField: UITextField = {
        $0.font = UIFont(name: "Avenir", size: UIScreen.main.bounds.height * 0.04)
        $0.textColor = UIColor.white
        $0.attributedPlaceholder = NSAttributedString(string:"email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: 0xFFFFFF, alpha: 0.5),
            NSAttributedString.Key.font: UIFont(name: "Avenir", size: UIScreen.main.bounds.height * 0.04) as Any])
        return $0
    }(UITextField())
    
    let passwordField: UITextField = {
        $0.font = UIFont(name: "Avenir", size: UIScreen.main.bounds.height * 0.04)
        $0.textColor = UIColor.white
        $0.attributedPlaceholder = NSAttributedString(string:"password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: 0xFFFFFF, alpha: 0.5),
            NSAttributedString.Key.font: UIFont(name: "Avenir", size: UIScreen.main.bounds.height * 0.04) as Any])
        return $0
    }(UITextField())
    
    let usernameField: UITextField = {
        $0.font = UIFont(name: "Avenir", size: UIScreen.main.bounds.height * 0.04)
        $0.textColor = UIColor.white
        $0.attributedPlaceholder = NSAttributedString(string:"username", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: 0xFFFFFF, alpha: 0.5),
            NSAttributedString.Key.font: UIFont(name: "Avenir", size: UIScreen.main.bounds.height * 0.04) as Any])
        return $0
    }(UITextField())
    
    let loginSelector = UISegmentedControl(items: ["Login", "Sign Up"])
    
    let submitButton: UIButton = {
        let attrStringNormal = NSAttributedString(string: "Submit", attributes:
        [
            NSAttributedString.Key.foregroundColor: UIColor(hex: 0xFFFFFF, alpha: 1.0),
            NSAttributedString.Key.font: UIFont(name: "Avenir", size: UIScreen.main.bounds.height * 0.04)!
            ]
        )
        let attrStringPressed = NSAttributedString(string: "Submit", attributes:
            [
                NSAttributedString.Key.foregroundColor: UIColor(hex: 0xFFFFFF, alpha: 0.5),
                NSAttributedString.Key.font: UIFont(name: "Avenir", size: UIScreen.main.bounds.height * 0.04)!
            ]
        )
        $0.setAttributedTitle(attrStringNormal, for: .normal)
        $0.setAttributedTitle(attrStringPressed, for: .highlighted)
        return $0
    }(UIButton())

    init() {
        super.init(frame: .zero)
        self.addSubview(emailField)
        self.addSubview(passwordField)
        self.addSubview(loginSelector)
        self.addSubview(usernameField)
        self.addSubview(submitButton)
        self.backgroundColor = UIColor(hex: 0x3d3d3d, alpha: 1.0)
        emailField.delegate = self
        passwordField.delegate = self
        usernameField.delegate = self
        formatEmailField()
        formatPasswordField()
        formatLoginSelector()
        formatUsernameField()
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
    
    private func formatUsernameField() {
        usernameField.layer.cornerRadius = 25
        usernameField.layer.borderWidth = 1
        usernameField.layer.borderColor = UIColor.white.cgColor
        usernameField.setLeftPaddingPoints(15)
    }
    
    private func formatLoginSelector() {
        loginSelector.selectedSegmentIndex = 0
        loginSelector.layer.borderColor = UIColor.white.cgColor
        loginSelector.layer.cornerRadius = 25
        loginSelector.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont(name: "Avenir", size: UIScreen.main.bounds.height * 0.04)!
            ], for: .normal)
        loginSelector.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.orange,
                NSAttributedString.Key.font: UIFont(name: "Avenir", size: UIScreen.main.bounds.height * 0.04)!
            ], for: .selected)
        loginSelector.tintColor = .clear
        loginSelector.layer.borderColor = UIColor.white.cgColor
        loginSelector.addTarget(self, action: #selector(toggleUsernameField), for: .valueChanged)
    }
    
    private func formatSubmitButton() {
        submitButton.showsTouchWhenHighlighted = true
    }
    
    @objc private func toggleUsernameField() {
            if self.loginSelector.selectedSegmentIndex == 1 {
                usernameField.snp.remakeConstraints { (make) in
                    make.centerY.equalToSuperview().offset(-100)
                    make.left.equalToSuperview().offset(40)
                    make.right.equalToSuperview().offset(-40)
                    make.height.equalTo(UIScreen.main.bounds.height * 0.08)
                }
            } else {
                usernameField.snp.remakeConstraints { (make) in
                    make.centerY.equalToSuperview().offset(-100)
                    make.left.equalToSuperview().offset(40)
                    make.right.equalToSuperview().offset(-40)
                    make.height.equalTo(0)
                }
            }
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    private func setupConstraints() {
        usernameField.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-100)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(0)
        }
        emailField.snp.remakeConstraints { (make) in
            make.top.equalTo(usernameField.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(UIScreen.main.bounds.height * 0.08)
        }
        
        passwordField.snp.remakeConstraints { (make) in
            make.top.equalTo(emailField.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(UIScreen.main.bounds.height * 0.08)
        }
        loginSelector.snp.remakeConstraints{ (make) in
            make.top.equalTo(passwordField.snp_bottomMargin).offset(40)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(UIScreen.main.bounds.height * 0.08)
        }
        submitButton.snp.remakeConstraints { (make) in
            make.top.equalTo(loginSelector.snp.bottomMargin).offset(40)
            make.width.equalTo(UIScreen.main.bounds.width * 0.25)
            make.height.equalTo(UIScreen.main.bounds.height * 0.08)
            make.centerX.equalToSuperview()
        }
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(hex: Int, alpha: CGFloat) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            alpha: alpha
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
