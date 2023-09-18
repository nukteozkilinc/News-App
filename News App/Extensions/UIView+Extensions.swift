//
//  UIView+Extensions.swift
//  News App
//
//  Created by Nukte Ozkilinc on 6.09.2023.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
