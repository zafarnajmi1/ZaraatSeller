//
//  MyProductCell.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 31/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  SDWebImage
protocol  manageProduct {
    func productManage(cell:MyProductCell )
}
class MyProductCell: UITableViewCell {

    @IBOutlet weak var lbltons2: UILabel!
    @IBOutlet weak var lblremainstock: UILabel!
    //@IBOutlet weak var lbltons: UILabel!
    //@IBOutlet weak var lblinstock: UILabel!
    @IBOutlet weak var lblproductName: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var mangView: UIView!
    var Delegate:manageProduct?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        mangView.viewconfig(radius: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(obj: Products) {
        //lbltons.text = obj.product_stock ?? "" + "Tons"
        lbltons2.text = obj.stock_threshold ?? "" + "Tons"
        img.sd_imageIndicator = SDWebImageActivityIndicator.gray
        img.sd_setImage(with: URL(string: obj.images![0].file_path ?? ""), placeholderImage: UIImage(named: "Grey Logo (1)"))
        
        lblproductName.text =  obj.product_title_en
    }
    @IBAction func manageProductAction(_ sender: UIButton) {
        Delegate?.productManage(cell: self)
    }
    
    
}
