//
//  DealProductCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
protocol  deleteDealProduct {
    func deleteproductList(cell : DealProductCell)
}
class DealProductCell: UICollectionViewCell {

    @IBOutlet weak var mainview: UIView!
    var delegate:deleteDealProduct?
    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainview.layer.cornerRadius = 8
        mainview.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mainview.layer.borderWidth = 0.5
    }

    @IBAction func deleteAction(_ sender: UIButton) {
        delegate?.deleteproductList(cell: self)
    }
}
