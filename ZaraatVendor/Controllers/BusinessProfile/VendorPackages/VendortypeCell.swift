//
//  VendortypeCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 5/19/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
protocol  deleteFeature {
    func deleteFeatureList(cell : VendortypeCell)
}
class VendortypeCell: UICollectionViewCell {

    var delegate:deleteFeature?
    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deleteAction(_ sender: UIButton) {
        delegate?.deleteFeatureList(cell: self)
    }
    
}
