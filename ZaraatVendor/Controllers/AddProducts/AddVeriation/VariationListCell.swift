//
//  VariationListCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class VariationListCell: UITableViewCell {
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lblvariationPrice: UILabel!
    
    @IBOutlet weak var lblstock: UILabel!
    @IBOutlet weak var lblVendorprice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
