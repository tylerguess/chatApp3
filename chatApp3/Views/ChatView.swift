//
//  ChatView.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/13/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit

class ChatView: UIView {

    let messagesTableView: UITableView = {
        $0.backgroundColor = UIColor(hex: 0x323232, alpha: 1.0)
        $0.separatorStyle = .singleLine
        return $0
    }(UITableView())
    
    let bottomBar = ChatBottomBar()
    
    init() {
        super.init(frame: .zero)
        self.addSubview(bottomBar)
        self.addSubview(messagesTableView)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        bottomBar.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.12)
        }
        messagesTableView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(bottomBar.snp_topMargin)
        }
    }

}
