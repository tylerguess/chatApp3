//
//  ChannelController.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/11/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit

class ChannelController: UIViewController {
    
    var coordinator: AppCoordinator?
    var channelsView = ChannelsView()
    
    var tempChannels = ["Channel 1", "Channel 2", "Channel 3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = channelsView
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: 0xEEEEEE, alpha: 1.0)
        
        channelsView.channelList.delegate = self
        channelsView.channelList.dataSource = self
        channelsView.channelList.register(ChannelCell.self, forCellReuseIdentifier: "channelCell")
    }

}

extension ChannelController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempChannels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.13
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as! ChannelCell
        cell.textLabel?.text = tempChannels[indexPath.item]
        cell.setBackgroundColor()
        return cell
    }
}
