//
//  DealDetailsCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class DealDetailsCell: UITableViewCell {

    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    
    
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    
    func setdate(obj:Deal_products){
        self.lblprice.text =  obj.selling_price
        self.lbltitle.text = obj.product_title_en
       // guard let url = obj.images?[0].file_path else {
        //    return
       // }
       // self.img.setPath(string:url, "Grey Logo")
    }
}
