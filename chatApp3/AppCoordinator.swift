//
//  AppCoordinator.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/5/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit
import Firebase

class AppCoordinator {
    
    var navigationController: UINavigationController
    var user: User?
    let db = Firestore.firestore()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        if let currentUser = Auth.auth().currentUser {
            setUserData(uid: currentUser.uid)
            goToChannels()
        } else {
            let authController = AuthController()
            authController.coordinator = self
            navigationController.pushViewController(authController, animated: false)
        }
    }
    
    func goToChannels() {
        let vc = ChannelController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func setUserData(uid: String) {
        let userDocRef = db.collection("users").document(uid)
        
        userDocRef.getDocument { (document, error) in
            if let document = document, document.exists {
                self.user = User(
                    username: document.get("username") as! String,
                    gold: document.get("gold") as! Int,
                    uid: uid
                )
            } else {
                print("Document doesn't exit")
            }
        }
    }
}
