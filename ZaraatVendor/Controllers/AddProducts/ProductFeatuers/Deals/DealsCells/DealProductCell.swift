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

    var delegate:deleteDealProduct?
    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deleteAction(_ sender: UIButton) {
        delegate?.deleteproductList(cell: self)
    }
}
