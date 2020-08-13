//
//  SalesListCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SalesListCell: UITableViewCell {

    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    
    func setdata(obj:Sales){
        self.lbldate.text = "Expiry Date : " + (formatedDatetype(string: ((obj.end_date)!)))
        self.lbltitle.text = obj.produt?.product_title_en
        self.lblprice.text = "Discount Price :" + (obj.sale_price ?? "")
        self.img.setPath(string: obj.produt?.image?[0].file_path, "Zaraat logo vertical png ( White ) (1)")
    }
}
