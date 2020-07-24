//
//  AddImageCell.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 31/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class AddImageCell: UICollectionViewCell {
    @IBOutlet weak var addimgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        addimgView.layer.cornerRadius = 8
        addimgView.layer.borderWidth = 1
        addimgView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
}
