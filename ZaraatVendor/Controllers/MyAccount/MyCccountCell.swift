//
//  MyCccountCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/19/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class MyCccountCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
