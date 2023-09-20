//
//  ProfilePageViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 19.09.2023.
//

import FirebaseAuth
import UIKit

protocol ProfilePageViewModelInterface {
    var view: ProfilePageViewInterface? { get set }
    func userLogout()
    func goToLogin()
}


final class ProfilePageViewModel {
    var view: ProfilePageViewInterface?
    var currentPassword: String?
    var newPassword: String?
}

extension ProfilePageViewModel: ProfilePageViewModelInterface {
 
    func userLogout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            UserDefaults.standard.set(false, forKey: "isLogin")
            UserDefaults.standard.synchronize()
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func goToLogin() {
        view?.editRootViewController()
        
    }
}
