//
//  ConversationCell.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 24/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ConversationCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        img.roundImg()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
