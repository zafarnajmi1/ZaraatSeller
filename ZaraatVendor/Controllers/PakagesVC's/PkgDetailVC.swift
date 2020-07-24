//
//  PkgDetailVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class PkgDetailVC: UIViewController {

    @IBOutlet weak var btngrade: UIButton!
    @IBOutlet weak var invoiceView: UIView!
    @IBOutlet weak var toView: UIView!
    @IBOutlet weak var FromView: UIView!
    //@IBOutlet weak var lblQty: UILabel!
    
    //@IBOutlet weak var lblPakge: UILabel!
    
    //@IBOutlet weak var lblsubTotal: UILabel!
    //@IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var uiviewtotal: UIView!
    
    
    @IBOutlet weak var lblDate: UILabel!
    
    
    //From
    
    @IBOutlet weak var lblvendorname: UILabel!
    @IBOutlet weak var lblvendorAdress: UILabel!
    @IBOutlet weak var lblvendorPhone: UILabel!
    @IBOutlet weak var lblVendorEmail: UILabel!
    
    //To
    
    @IBOutlet weak var lblcompanyname: UILabel!
    @IBOutlet weak var lblcompanyAddress: UILabel!
    
    @IBOutlet weak var lblCompanyPhone: UILabel!
    
    @IBOutlet weak var lblCopanyemail: UILabel!
    
    //Invoice
   // @IBOutlet weak var lblInvoice: UILabel!
    @IBOutlet weak var lbldueDate: UILabel!
    @IBOutlet weak var lblAccountno: UILabel!
    
    
    
    @IBOutlet weak var lbltotal: UILabel!
    @IBOutlet weak var lblDueAmount: UILabel!
    @IBOutlet weak var lblPkgsubtotal: UILabel!
    
    
    var pkgid = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Package Detail"
        addBackButton()
//        lblQty.text =  "QTY  : " + "1"
//        lblPakge.text = "Package  : " + "Silver"
//        lblDescription.text = "Description  : " + "Upgrade to Silver"
//        lblsubTotal.text = "Subtotal  : " + "1500 /-"
        uiviewtotal.layer.cornerRadius = 8
        uiviewtotal.layer.borderColor = #colorLiteral(red: 0.7646217346, green: 0.764754355, blue: 0.7646133304, alpha: 1)
        uiviewtotal.layer.borderWidth = 1
        setupDetail()
        getpkgdetailapi()
    }
    
    
    func getDate() -> String{
        let date = Date()
        let formatter =  DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let result = formatter.string(from: date)
        return result

    }
    
    func setupDetail() {
        btngrade.roundButton()
        self.toView.layer.cornerRadius = 5
        self.toView.layer.borderWidth = 1
        self.toView.layer.borderColor = #colorLiteral(red: 0.7646217346, green: 0.764754355, blue: 0.7646133304, alpha: 1)
        
               self.FromView.layer.cornerRadius = 5
               self.FromView.layer.borderWidth = 1
               self.FromView.layer.borderColor = #colorLiteral(red: 0.7646217346, green: 0.764754355, blue: 0.7646133304, alpha: 1)
        
               self.invoiceView.layer.cornerRadius = 5
               self.invoiceView.layer.borderWidth = 1
               self.invoiceView.layer.borderColor = #colorLiteral(red: 0.7646217346, green: 0.764754355, blue: 0.7646133304, alpha: 1)
    }
    
    
    
    func getpkgdetailapi(){
        ShareData.showProgress()
        userhandler.getPkgDetail(id: pkgid, Success: {response in
            ShareData.hideProgress()
            ShareData.shareInfo.pkg =  response.my_package
            self.lblvendorname.text =  response.user?.owners_name
            self.lblvendorPhone.text =  "Phone :" +  (response.user?.phone)!
            self.lblvendorAdress.text = response.user?.address
            self.lblVendorEmail.text = "Email :" +  (response.user?.email)!
            
            //self.lblInvoice.text = "Invoice ID : " +  "\(response.transection_id ?? "")"
            
            //self.lblQty.text = "QTY   :" + "1"
           // self.lblPakge.text = "Package  : " + (response.my_package?.package_name)!
            //self.lblDescription.text = "Description  : " +  "Upgraded to " + (response.my_package?.package_name)!
            //self.lblsubTotal.text = "Subtotal  : " + (response.my_package?.price)!
            self.lbldueDate.text = "Payment Due :" + self.getDate()
            self.lblDate.text = self.getDate()
            self.lblDueAmount.text = response.my_package?.price
            self.lblPkgsubtotal.text = response.my_package?.price
            self.lbltotal.text = response.my_package?.price
            
        }, Failure: {error in
             ShareData.hideProgress()
        })
    }
    
    
    
    
    

    @IBAction func upgradeAction(_ sender: UIButton) {
         moveOnReceipt() 
    }
    func moveOnReceipt() {
           if UIDevice.current.userInterfaceIdiom == .pad {

                 let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                 let vc =  storyBoard.instantiateViewController(withIdentifier: "AddReceiptVC") as? AddReceiptVC
                 
              
                 self.navigationController?.pushViewController(vc!, animated: true)

           } else {

                 let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                 let vc =  storyBoard.instantiateViewController(withIdentifier: "AddReceiptVC") as? AddReceiptVC
                  
              
                 self.navigationController?.pushViewController(vc!, animated: true)
           }
           
       }

}
