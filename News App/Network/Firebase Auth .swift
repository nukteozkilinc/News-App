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
    
    func changePassword(newPassword: String, vc: UIViewController) {
        Auth.auth().currentUser?.updatePassword(to: newPassword) { error in
            if let e = error {
                Alerts.shared.presentAlert(on: vc, with: "", message: String(e.localizedDescription), options: "OK") { _ in
                    print(String(error!.localizedDescription))
                }
            }
            Alerts.shared.presentAlert(on: vc, with: "SUCCESS", message: "Your password has changed. Please login again.", options: "OK") { _ in
                
            }
            
        }
    }
    
    func signIn(email: String?, password: String?, vc: UIViewController) {
        
        if let email, let password {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error {
                    // MARK: Buraya alert ekle!
                    Alerts.shared.presentAlert(on: vc, with: "Sifre ya da kullanici adi yanlis", message: "Bilgilerinizi kontrol edip tekrar giriniz.", options: "OK") {_ in
                        print(error.localizedDescription)
                    }
                } else {
                    print("Sign in")
                    // MARK: Buraya nav ekle!
                    vc.performSegue(withIdentifier: "goToNews", sender: nil)
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
                    Alerts.shared.presentAlert(on: vc, with: "HATA!", message: "Bir seyler hatali", options: "OK") { _ in
                        print(error.localizedDescription)
                    }
                }else {
                    Alerts.shared.presentAlert(on: vc, with: "Kullanici kaydedildi!", message: "Basarili bir sekilde kayit olundu", options: "OK") { _ in
                        // MARK: Perform to main screen
                    }
                }
            }
        }
    }
}
