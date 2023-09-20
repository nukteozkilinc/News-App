//
//  UIViewController+Extensions.swift
//  News App
//
//  Created by Nukte Ozkilinc on 16.09.2023.
//

import UIKit

class Alerts {
    
    static var shared = Alerts()
    
    func presentAlert(on vc: UIViewController, with title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { action in
                completion(index)
            }))
        }
        vc.present(alertController, animated: true, completion: nil)
    }
    

}
