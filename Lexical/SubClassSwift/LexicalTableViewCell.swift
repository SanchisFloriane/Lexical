//
//  LexicalTableViewCell.swift
//  Lexical
//
//  Created by Floriane Sanchis on 10/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit

class LexicalSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var nameWord: UILabel?
    @IBOutlet weak var traductionWord: UILabel?
    @IBOutlet weak var imgToLearn: UIImageView?
    @IBOutlet weak var imgToNew: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // Configure the view for the selected state
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
   
}
