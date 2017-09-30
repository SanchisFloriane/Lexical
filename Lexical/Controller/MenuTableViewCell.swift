//
//  MenuTableViewCell.swift
//  Lexical
//
//  Created by Floriane Sanchis on 29/09/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell
{
    @IBOutlet weak var imgIconMenu: UIImageView!
    
    @IBOutlet weak var lblMenuName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
