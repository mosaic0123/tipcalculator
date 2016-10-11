//
//  MenuTableViewCell.swift
//  Tip Calculator
//
//  Created by tingting_gao on 10/2/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
   
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
