//
//  SenderTxtCell.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 25/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SenderTxtCell: UITableViewCell {
    @IBOutlet weak var userimg: UIImageView!
    
    @IBOutlet weak var msgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        userimg.roundImg()
        self.selectionStyle = .none
        msgView.round([ .bottomRight, .topRight,.topLeft], radius: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
