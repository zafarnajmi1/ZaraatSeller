//
//  OrderCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    //@IBOutlet weak var btnordermanage: UIButton!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        img.layer.cornerRadius = 8
        img.layer.borderColor =  #colorLiteral(red: 0.7007732391, green: 0.7412289977, blue: 0.7496894598, alpha: 1)
        img.layer.borderWidth = 1
        mainView.cardShadow()
//        mainView.layer.borderWidth = 0.8
//        mainView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        mainView.layer.cornerRadius = 8
//        img.layer.cornerRadius = 15
        //btnordermanage.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
