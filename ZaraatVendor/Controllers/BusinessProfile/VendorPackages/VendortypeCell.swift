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

    @IBOutlet weak var mainView: UIView!
    var delegate:deleteFeature?
    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mainView.layer.cornerRadius =  5
        self.mainView.layer.borderWidth =  0.5
        self.mainView.layer.borderColor =  #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
    }

    @IBAction func deleteAction(_ sender: UIButton) {
        delegate?.deleteFeatureList(cell: self)
    }
    
}
