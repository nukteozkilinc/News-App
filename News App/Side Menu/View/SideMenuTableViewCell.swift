//
//  SideMenuTableViewCell.swift
//  News App
//
//  Created by Nukte Ozkilinc on 20.09.2023.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
