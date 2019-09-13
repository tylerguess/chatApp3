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
        $0.backgroundColor = UIColor(hex: 0x323232, alpha: 1.0)
        $0.separatorStyle = .none
        $0.separatorColor = UIColor.white
        $0.separatorEffect = UIBlurEffect(style: .regular)
        $0.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
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
