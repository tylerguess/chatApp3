//
//  ChannelCell.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/12/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
    let randomColors: [UIColor] = [.red, .blue, .yellow, .orange, .green, .purple, .cyan, .magenta]
    
    let cardView: UIView = {
        $0.backgroundColor = UIColor(hex: 0x323232, alpha: 1.0)
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
        return $0
    }(UIView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(cardView)
        self.backgroundColor = .clear
        self.textLabel?.font = UIFont(name: "Avenir", size: UIScreen.main.bounds.height * 0.07)
        self.textLabel?.textColor = UIColor.white
        self.accessoryType = .disclosureIndicator
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setBackgroundColor() {
        let randomNum = Int.random(in: 0..<8)
        cardView.backgroundColor = randomColors[randomNum]
    }
    
    func setupConstraints() {
        cardView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-5)
        }
    }

}
