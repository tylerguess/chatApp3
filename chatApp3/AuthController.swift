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
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view = SignUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension AuthController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
