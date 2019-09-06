//
//  AuthController.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/5/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit
import SnapKit

class AuthController: UIViewController {
    
    // This is the view controller's view
    var signUpView = SignUpView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view = signUpView
        signUpView.submitButton.addTarget(self, action: #selector(authenticate), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func authenticate() {
        print("Authenticated")
    }
    
}

