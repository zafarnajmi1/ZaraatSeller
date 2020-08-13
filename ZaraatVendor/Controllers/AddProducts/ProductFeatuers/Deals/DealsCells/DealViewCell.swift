//
//  DealViewCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class DealViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblEndDate: UILabel!
    @IBOutlet weak var lblstarDate: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func SetaData(obj:Deals){
        self.lbltitle.text = obj.deal_title_en
        self.lblprice.text = "Price :" + (obj.deal_price ?? "")
        self.lblstarDate.text =  "Start Date :" +  ((formatedDatetype(string: ((obj.deal_start_date)!))))
        self.lblEndDate.text = "End Date :" + ((formatedDatetype(string: ((obj.deal_end_date)!))))
        self.img.setPath(string: obj.deal_image, "Zaraat logo vertical png ( White ) (1)")
    }
}
