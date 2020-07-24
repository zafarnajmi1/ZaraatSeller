//
//  CouponsListCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
protocol manageCoupon {
    func couponMange(cell:CouponsListCell )
}
class CouponsListCell: UITableViewCell {

    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    var delegate:manageCoupon?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func manageCoupnAction(_ sender: UIButton) {
        delegate?.couponMange(cell: self)
    }
}
