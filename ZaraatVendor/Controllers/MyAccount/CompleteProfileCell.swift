//
//  CompleteProfileCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/19/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class CompleteProfileCell: UITableViewCell {

    @IBOutlet weak var completeView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
      if   ShareData.shareInfo.userInfo?.vendors?.status == 1  {
            self.completeView.isHidden = true
        } else {
            self.completeView.isHidden = false
        }
        completeView.roundView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
