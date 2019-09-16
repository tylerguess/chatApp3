//
//  MessageTableViewCell.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/16/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    let usernameLabel: UILabel = {
        $0.backgroundColor = .blue
        return $0
    }(UILabel())
    
    let messageContainer: UIView = {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
        return $0
    }(UILabel())
    
    let messageLabel: UILabel = {
        $0.numberOfLines = 0
        return $0
    }(UILabel())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(usernameLabel)
        self.contentView.addSubview(messageContainer)
        messageContainer.addSubview(messageLabel)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupConstraints() {
        messageContainer.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(UIScreen.main.bounds.width * 0.55)
            make.height.greaterThanOrEqualTo(70)
        }
        
        messageLabel.snp.remakeConstraints {(make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        usernameLabel.snp.remakeConstraints { (make) in
            make.bottom.equalTo(messageContainer.snp_topMargin).offset(-5)
            make.left.equalTo(messageContainer.snp_leftMargin)
            make.right.equalTo(messageContainer.snp_rightMargin)
            make.top.equalToSuperview()
        }
    }

}
