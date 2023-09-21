//
//  LoginModelViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 8.09.2023.
//

import UIKit

protocol LoginViewModelInterface {
    func loginUser(email: String, password: String, vc: UIViewController)
    func controlOnboarding()
}

class LoginViewModelController {
    var firebaseAuth = FirebaseAuth.shared
}

extension LoginViewModelController: LoginViewModelInterface {
    
    func controlOnboarding() {
        UserDefaults.standard.set(true, forKey: "notFirstInApp")
        UserDefaults.standard.synchronize()
    }
    
    
    func loginUser(email: String, password: String, vc: UIViewController) {
        firebaseAuth.signIn(email: email, password: password, vc: vc)
        UserDefaults.standard.set(true, forKey: "isLogin")
        UserDefaults.standard.synchronize()
    }
}
