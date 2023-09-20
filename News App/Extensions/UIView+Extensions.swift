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

extension UIImage {
    func scaleImage(toSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }

        self.draw(in: CGRect(origin: .zero, size: newSize))
        if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
            return newImage
        }
        return self
    }
}
