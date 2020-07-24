//
//  SupportCell.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 29/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SupportCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbltitl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
