//
//  SavePageTableViewCell.swift
//  News App
//
//  Created by Nukte Ozkilinc on 19.09.2023.
//

import UIKit

class SavePageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblSavedTitle: UILabel!
    @IBOutlet weak var lblSavedDescription: UILabel!
    @IBOutlet weak var imgSaved: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
