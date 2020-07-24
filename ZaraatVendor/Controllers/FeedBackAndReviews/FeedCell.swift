//
//  FeedCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/18/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import Cosmos
class FeedCell: UITableViewCell {

    @IBOutlet weak var productimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        productimg.layer.cornerRadius =  5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
