//
//  ChatBottomBar.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/13/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit

class ChatBottomBar: UIView {
    
    let messageTextView: UITextView = {
        $0.layer.cornerRadius = 10
        return $0
    }(UITextView())
    
    let sendButton: UIButton = {
        $0.setTitle("Send", for: .normal)
        return $0
    }(UIButton())

    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(hex: 0x202020, alpha: 1.0)
        self.addSubview(messageTextView)
        self.addSubview(sendButton)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        sendButton.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview().offset(4)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(UIScreen.main.bounds.width * 0.14)
        }
        messageTextView.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview().offset(4)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.right.equalTo(sendButton.snp_leftMargin).offset(-10)
            make.width.equalTo(UIScreen.main.bounds.width * 0.75)
        }
        
    }
    
}
