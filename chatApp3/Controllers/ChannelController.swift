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
    
    var channels = ["Channel 1", "Channel 2", "Channel 3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = channelsView
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: 0x202020, alpha: 1.0)
        self.navigationController?.navigationBar.topItem?.title = "Channels"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addChannel))
         self.navigationController?.navigationBar.topItem?.rightBarButtonItem?.tintColor = .white
        
        channelsView.channelList.delegate = self
        channelsView.channelList.dataSource = self
        channelsView.channelList.register(ChannelCell.self, forCellReuseIdentifier: "channelCell")
    }
    
    @objc func addChannel() {
        let ac = UIAlertController(title: "Enter Channel Name", message: nil, preferredStyle: .alert)
        ac.addTextField(configurationHandler: nil)
        let submitAction = UIAlertAction(title: "Add", style: .default) { [unowned ac] _ in
            let channelName = ac.textFields![0]
            self.channels.append(channelName.text ?? "")
            self.channelsView.channelList.reloadData()
        }
        ac.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        ac.addAction(submitAction)
        self.present(ac, animated: true)
    }

}

extension ChannelController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as! ChannelCell
        cell.textLabel?.text = channels[indexPath.item]
        //cell.setBackgroundColor()
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            channels.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.coordinator?.goToChat()
    }
}
