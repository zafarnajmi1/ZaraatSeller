//
//  VariationCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/7/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class VariationCell: UITableViewCell {

    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func loadCell(object : Attribute_values){
    
        lbltitle.text = object.attribute_values
    
    }
    
    func loadCell1(object : Vals){
    
        lbltitle.text = object.attribute_values?.attribute_values
    
    }
}
