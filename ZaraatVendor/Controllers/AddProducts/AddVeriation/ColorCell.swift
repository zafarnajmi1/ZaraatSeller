//
//  ColorCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/8/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ColorCell: UITableViewCell {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
//        let color2 = UIColor(hex: "#ff0000")
//        colorView.backgroundColor = color2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func loadCell(object : Attribute_values){
    
        lbltitle.text = object.attribute_values
        let color2 = UIColor(hex: object.attribute_values!)
          colorView.backgroundColor = color2
    
    }
    func loadCell1(object : Vals){
    
        lbltitle.text = object.attribute_values?.attribute_values
        let color2 = UIColor(hex: object.attribute_values!.attribute_values!)
          colorView.backgroundColor = color2
    
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
extension UIColor {

  convenience init(hex: String, alpha: CGFloat = 1.0) {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) { cString.removeFirst() }

    if ((cString.count) != 6) {
      self.init(hex: "ff0000") // return red color for wrong hex input
      return
    }

    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }

}
