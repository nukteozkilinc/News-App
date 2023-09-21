//
//  Firebase Auth .swift
//  News App
//
//  Created by Nukte Ozkilinc on 16.09.2023.
//

import UIKit
import FirebaseAuth


final class FirebaseAuth {
    
    static let shared = FirebaseAuth()
    
    func signIn(email: String?, password: String?, vc: UIViewController) {
        
        if let email, let password {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error {
                    // MARK: Buraya alert ekle!
                    Alerts.shared.presentAlert(on: vc, with: "Password or user name is wrong", message: "Please check your user name or password and try again.", options: "OK") {_ in
                        print(error.localizedDescription)
                    }
                } else {
                    print("Sign in")
                    // MARK: Buraya nav ekle!
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let newsDetailVC = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                    
                    newsDetailVC.navigationItem.hidesBackButton = true
                    vc.navigationController?.pushViewController(newsDetailVC, animated: true)
                }
            }
        }
    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Sign out error \(signOutError)")
        }
    }
    
    func register(email: String?, password: String?, vc: UIViewController) {
        
        if let email, let password {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error {
                    Alerts.shared.presentAlert(on: vc, with: "FAILED", message: String(error.localizedDescription), options: "OK") { _ in
                        print(error.localizedDescription)
                    }
                }else {
                    Alerts.shared.presentAlert(on: vc, with: "Success", message: "User has registered successfully", options: "OK") { _ in
                        // MARK: Perform to main screen
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let newsDetailVC = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                        
                        vc.navigationController?.pushViewController(newsDetailVC, animated: true)
                    }
                }
            }
        }
    }
//    func register(email: String?, password: String?, vc: UIViewController) {
//        
//        if let email, let password {
//            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//                if let error {
//                    Alerts.shared.presentAlert(on: vc, with: "FAILED!", message: String(error.localizedDescription), options: "OK") { _ in
//                        print(error.localizedDescription)
//                    }
//                }else {
//                    Alerts.shared.presentAlert(on: vc, with: "SAVED!", message: "User saved successfully", options: "OK") { _ in
//                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                        let newsDetailVC = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
//
//                        newsDetailVC.navigationItem.hidesBackButton = true
//                        vc.navigationController?.pushViewController(newsDetailVC, animated: true)
//                    }
//                }
//            }
//        }
//    }
}
