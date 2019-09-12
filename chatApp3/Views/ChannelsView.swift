//
//  ChannelsView.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/12/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit

class ChannelsView: UIView {
    
    let channelList: UITableView = {
        $0.backgroundColor = UIColor(hex: 0xEEEEEE, alpha: 1.0)
        $0.separatorStyle = .none
        return $0
    }(UITableView())

    init() {
        super.init(frame: .zero)
        self.addSubview(channelList)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        channelList.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
