//
//  RegisterViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 17.09.2023.
//

import UIKit

protocol RegisterViewModelProtocol {
    func registerUser(email: String, password: String)
}

class RegisterViewModel {
    var view = RegisterPageViewController()
}


extension RegisterViewModel: RegisterViewModelProtocol {
    func registerUser(email: String, password: String) {
        FirebaseAuth.shared.register(email: email, password: password, vc: view)
    }
    
    
}
