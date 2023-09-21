//
//  PasswordPageViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 21.09.2023.
//

import Foundation
import FirebaseAuth

protocol PasswordPageViewModelInterface {
    var view: PasswordPageProtocol? { get set }
    func changePassword(currentPassword: String, newPassword: String)
}

class PasswordPageViewModel {
    var view: PasswordPageProtocol?
}

extension PasswordPageViewModel: PasswordPageViewModelInterface {
    
    func changePassword(currentPassword: String, newPassword: String) {
        if currentPassword == newPassword {
            view?.showSamePasswordAlert()
        } else {
            Auth.auth().currentUser?.updatePassword(to: newPassword) {
                error in
                if let e = error {
                    self.view?.showFailedError(error: e)
                }
                self.view?.showSuccessAlert()
            }
        }
    }
}
