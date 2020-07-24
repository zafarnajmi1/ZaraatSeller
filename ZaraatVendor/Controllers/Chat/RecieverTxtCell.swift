//
//  RecieverTxtCell.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 25/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class RecieverTxtCell: UITableViewCell {
    //@IBOutlet weak var userimg: UIImageView!
    
    @IBOutlet weak var msgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        //userimg.roundImg()
        msgView.round([ .bottomLeft, .topRight,.topLeft], radius: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
