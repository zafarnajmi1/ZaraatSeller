//
//  ViewImageCell.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 31/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
protocol deleteImg {
    func deleteproductImg(cell:ViewImageCell)
}
class ViewImageCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIView!
    var delegate : deleteImg?
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 8
        imgView.layer.borderWidth =  1
        imgView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
       // imgView.layer.borderWidth = 1
       // imgView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    @IBAction func deleteAction(_ sender: UIButton) {
        delegate?.deleteproductImg(cell: self)
    }
    
    func setData(model: Gallery)  {
        
        print("check ",model.file_path)
        self.img.setPath(string: model.file_path, "")
    }
    
    
}
