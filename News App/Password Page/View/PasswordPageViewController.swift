//
//  PasswordPageViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 20.09.2023.
//

import UIKit
import FirebaseAuth

protocol PasswordPageProtocol: AnyObject {
    func showSamePasswordAlert()
    func showFailedError(error: Error)
    func showSuccessAlert()
}

final class PasswordPageViewController: UIViewController {
    
    private lazy var viewModel: PasswordPageViewModelInterface = PasswordPageViewModel()
    
    @IBOutlet weak var txtCurrentPassword: UITextField?
    @IBOutlet weak var txtNewPassword: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
    }
    
    
    @IBAction func pressedDone(_sender: UIButton) {
        
        if let currentPassword = txtCurrentPassword?.text, let newPassword = txtNewPassword?.text {
            viewModel.changePassword(currentPassword: currentPassword, newPassword: newPassword)
        }
    }
}

extension PasswordPageViewController: PasswordPageProtocol {
    func showSuccessAlert() {
        Alerts.shared.presentAlert(on: self, with: "SUCCESS", message: "Your password has changed. Please login again.", options: "OK") { _ in
        }
    }
    
    
    func showFailedError(error: Error) {
            Alerts.shared.presentAlert(on: self, with: "", message: String(error.localizedDescription), options: "OK") { _ in
                self.dismiss(animated: true)
            }
        
    }
    
    func showSamePasswordAlert() {
        Alerts.shared.presentAlert(on: self, with: "FAILED", message: "Old password and new password cannot be the same", options: "OK") { _ in
            self.dismiss(animated: true)
        }
    }
    
    
}
