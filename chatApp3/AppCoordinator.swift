//
//  AppCoordinator.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/5/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    init() {
        
    }
    
    func start(window: UIWindow) {
        let vc = AuthController()
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
}
