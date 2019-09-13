//
//  ChatController.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/13/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit

class ChatController: UIViewController {
    
    let chatView = ChatView()
    var coordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = chatView
        chatView.messagesTableView.delegate = self
        chatView.messagesTableView.dataSource = self
        
        chatView.messagesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }
    



}

extension ChatController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
