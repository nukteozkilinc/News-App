//
//  PasswordPageViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 20.09.2023.
//

import UIKit
import FirebaseAuth

class PasswordPageViewController: UIViewController {
    
    @IBOutlet weak var txtCurrentPassword: UITextField?
    @IBOutlet weak var txtNewPassword: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func pressedDone(_sender: UIButton) {
        
        if let currentPassword = txtCurrentPassword?.text, let newPassword = txtNewPassword?.text {
            
            if currentPassword == newPassword {
                Alerts.shared.presentAlert(on: self, with: "FAILED", message: "Old password and new password cannot be the same", options: "OK") { _ in
                    
                }
            } else {
                FirebaseAuth.shared.changePassword(newPassword: newPassword, vc: self)
            }
            
        }
        
    }
    
}