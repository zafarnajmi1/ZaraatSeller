//
//  AllOrderCell.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 30/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class AllOrderCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    //@IBOutlet weak var btnViewOrder: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        //btnViewOrder.roundButton()
        mainView.viewSetUp(radius: 8, color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), borderwidth: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
