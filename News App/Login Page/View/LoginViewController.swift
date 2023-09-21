//
//  LoginViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 8.09.2023.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    
    lazy var viewModel: LoginViewModelInterface? = LoginViewModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.controlOnboarding()
        navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func pressedLogin(_ sender: UIButton) {
        if let email = tfEmail.text, let password = tfPassword.text {
            viewModel?.loginUser(email: email, password: password, vc: self)
        }
    }
}
