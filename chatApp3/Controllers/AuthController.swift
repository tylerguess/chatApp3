//
//  AuthController.swift
//  chatApp3
//
//  Created by Tyler Guess on 9/5/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

class AuthController: UIViewController {
    
    // This is the view controller's view
    var signUpView = SignUpView()
    var coordinator: AppCoordinator?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view = signUpView
        signUpView.submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createUser() {
        Auth.auth().createUser(withEmail: signUpView.emailField.text!, password: signUpView.passwordField.text!) { authResult, error in
            if let result = authResult {
                let db = Firestore.firestore()
                let userData: [String : Any] = [
                    "username" : self.signUpView.usernameField.text!,
                    "gold" : 0
                    ]
                db.collection("users").document(result.user.uid).setData(userData)
                let authenticatedUser = User(username: self.signUpView.usernameField.text!, gold: 0, uid: result.user.uid)
                self.coordinator?.user = authenticatedUser
                print(self.coordinator?.user)
                self.coordinator?.goToChannels()
            } else {
                let alertController = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                self.present(alertController, animated: true)
            }
        }
    }
    
    func loginUser() {
        Auth.auth().signIn(withEmail: signUpView.emailField.text!, password: signUpView.passwordField.text!) { authDataResult, error in
            if authDataResult != nil {
                self.coordinator?.setUserData(uid: (authDataResult?.user.uid)!)
                self.coordinator?.goToChannels()
            } else {
                let alertController = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                self.present(alertController, animated: true)
            }
        }
    }
    
    @objc func submit() {
        if signUpView.loginSelector.selectedSegmentIndex == 1 {
            createUser()
        } else {
            loginUser()
        }
    }
    
}

