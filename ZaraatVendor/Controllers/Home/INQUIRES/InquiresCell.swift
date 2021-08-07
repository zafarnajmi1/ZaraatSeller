//
//  InquiresCell.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
protocol InquiriesReply {
    func replyinquireis(cell: InquiresCell)
}
class InquiresCell: UITableViewCell {
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblmsg: UILabel!
    
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var mainView: UIView!
       @IBOutlet weak var btnordermanage: UIButton!
    var delegate:InquiriesReply?
       override func awakeFromNib() {
           super.awakeFromNib()
           self.selectionStyle = .none
        self.mainView.cardShadow()
//           mainView.layer.borderWidth = 0.8
//           mainView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//           mainView.layer.cornerRadius = 8
           //btnordermanage.roundButton()
       }
    //@IBAction func sendreplyAction(_ sender: UIButton) {
     //   self.delegate?.replyinquireis(cell: self)
        
    //}
    
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }
       
}
