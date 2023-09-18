//
//  LoginModelViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 8.09.2023.
//

import UIKit

protocol LoginViewModelInterface {
    func loginUser(email: String, password: String, vc: UIViewController)
}

class LoginViewModelController {
    
    var view = LoginViewController()
    var firebaseAuth = FirebaseAuth.shared
}

extension LoginViewModelController: LoginViewModelInterface {
    func loginUser(email: String, password: String, vc: UIViewController) {
        firebaseAuth.signIn(email: email, password: password, vc: vc)
    }
    
    
}
