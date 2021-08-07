//
//  ClientMessageVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 8/6/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ClientMessageVC: UIViewController {
var enquiresDetail : Enquiries?
    @IBOutlet weak var btnreply: UIButton!
    @IBOutlet weak var lblmsg: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblname: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Inquiry"
       addBackButton()
        setNavigationBar()
        UIApplication.shared.setStatusBar()
        btnreply.roundButton()
        mainView.layer.cornerRadius =  8
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor =  #colorLiteral(red: 0, green: 0, blue: 0.148468256, alpha: 1)
        self.lblmsg.text = enquiresDetail?.message
        self.lblname.text =  enquiresDetail?.customer?.first_name
    }
    

    @IBAction func sendmsgAction(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InquiriesReplyVC") as! InquiriesReplyVC
        vc.enquiresDetail = enquiresDetail
         vc.modalPresentationStyle = .currentContext
         vc.providesPresentationContextTransitionStyle = true
         vc.definesPresentationContext = true
         vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
         vc.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
         self.present(vc, animated: true, completion: nil)
    }
    

}
