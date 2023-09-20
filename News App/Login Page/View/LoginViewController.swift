//
//  LoginViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 8.09.2023.
//

import UIKit

protocol LoginViewInterface {
    
}

class LoginViewController: UIViewController{
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    
    lazy var viewModel: LoginViewModelInterface? = LoginViewModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "notFirstInApp")
        UserDefaults.standard.synchronize()
        navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func pressedLogin(_ sender: UIButton) {
        
        if let email = tfEmail.text, let password = tfPassword.text {
            viewModel?.loginUser(email: email, password: password, vc: self)
        }
        
    }
    
}
