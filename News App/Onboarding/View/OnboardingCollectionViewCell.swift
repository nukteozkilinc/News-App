//
//  OnboardingCollectionViewCell.swift
//  News App
//
//  Created by Nukte Ozkilinc on 6.09.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    func setUp(_ slide: OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
}
