//
//  HomePageTableViewCell.swift
//  News App
//
//  Created by Nukte Ozkilinc on 13.09.2023.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var pressedSave: UIButton!
    var selectedNews: Articles?
    lazy var viewmodel: HomePageViewModelInterface = HomePageViewModel()
    
    @IBOutlet weak var lblTitle: UILabel! {
        didSet {
            lblTitle.textColor = .white
        }
    }
    
    @IBOutlet weak var lblDescription: UILabel! {
        didSet {
            lblDescription.textColor = .white
        }
    }

    @IBOutlet weak var imgNew: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func pressedSave(_ sender: UIButton) {
        
        if selectedNews?.isLiked == 0 || selectedNews?.isLiked == nil {
            selectedNews?.isLiked = 1
            viewmodel.saveNews(selectedNews: selectedNews)
        } else {
            print("SILINDI")
            selectedNews?.isLiked = 0
        }
    }
}
