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
    var messages: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = chatView
        chatView.messagesTableView.delegate = self
        chatView.messagesTableView.dataSource = self
        chatView.messagesTableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "messageCell")
        chatView.messagesTableView.estimatedRowHeight = 50
        chatView.messagesTableView.rowHeight = UITableView.automaticDimension
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        chatView.bottomBar.sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @objc func sendMessage() {
        messages.append(chatView.bottomBar.messageTextView.text)
        chatView.bottomBar.messageTextView.text = ""
        chatView.messagesTableView.reloadData()
        chatView.bottomBar.messageTextView.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    



}

extension ChatController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
        cell.messageLabel.text = messages[indexPath.item]
        return cell
    }
}
