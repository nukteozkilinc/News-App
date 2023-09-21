//
//  RegisterPageViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 16.09.2023.
//

import UIKit

class RegisterPageViewController: UIViewController {
    
    @IBOutlet weak var registerTfMail: UITextField!
    @IBOutlet weak var registerTfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func pressedRegister(_sender: UIButton) {
        
        if let mail = registerTfMail.text, let password = registerTfPassword.text {
            FirebaseAuth.shared.register(email: mail, password: password, vc: self)
        }
    }
}
