//
//  PkgsCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class PkgsCell: UITableViewCell {

    @IBOutlet weak var lblshowcase: UILabel!
    
    @IBOutlet weak var lblprice: UILabel!
    
    @IBOutlet weak var lblValidity: UILabel!
    @IBOutlet weak var lblAccounts: UILabel!
    
    @IBOutlet weak var lblVerification: UILabel!
    @IBOutlet weak var lblMarketing: UILabel!
    
    @IBOutlet weak var lblads: UILabel!
    
    @IBOutlet weak var lblworkshops: UILabel!
    
    @IBOutlet weak var lblreporting: UILabel!
    
    @IBOutlet weak var lblEnquiries: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
