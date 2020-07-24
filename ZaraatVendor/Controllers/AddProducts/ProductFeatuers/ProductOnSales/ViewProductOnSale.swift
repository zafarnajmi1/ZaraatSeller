//
//  ViewProductOnSale.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewProductOnSale: UIViewController {

    @IBOutlet weak var lbldiscountPrice: UILabel!
    @IBOutlet weak var lbldicount: UILabel!
    @IBOutlet weak var lblexpiryDate: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lblproductname: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var deleteSaleView: UIView!
    @IBOutlet weak var editSaleView: UIView!
    
    var saleid = 0
    var id = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "View Product On Sale"
        deleteSaleView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        editSaleView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        self.addBackButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        saleDetailApi()
    }
    
    
    func saleDetailApi() {
         ShareData.showProgress()
        userhandler.getSingleSale(id: saleid, Success: {response in
             ShareData.hideProgress()
            if response.success == 1 {
                self.lblprice.text = "Actuall Price :" +  (response.sale?.actual_price)!
                self.id = response.sale?.onsale_id ?? 0
                self.lbldicount.text = "Discount :" +  "\(response.sale?.discount_percent! ?? 0)" + "%"
                self.lbldiscountPrice.text = "Sale Price : " +  (response.sale?.sale_price)!
                self.img.setPath(string: response.product?.image![0].file_path, "Grey Logo")
                self.lblproductname.text = response.product?.product_title_en
            } else {
                ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    @IBAction func editSaleActio(_ sender: UIButton) {
        if UIDevice.current.userInterfaceIdiom == .pad {
                    
                    let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                    let vc =  storyBoard.instantiateViewController(withIdentifier: "AddSaleVC") as? AddSaleVC
                        vc?.checktype =  false
                        vc?.saleid =  saleid
                    self.navigationController?.pushViewController(vc!, animated: true)

                    } else {

                    let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                    let vc =  storyBoard.instantiateViewController(withIdentifier: "AddSaleVC") as? AddSaleVC
                      vc?.checktype =  false
                       vc?.saleid =  saleid
                    self.navigationController?.pushViewController(vc!, animated: true)
                    }
    }
    
    @IBAction func deleteSaleAction(_ sender: UIButton) {
       
               let alert = UIAlertController(title: "Alert", message: "Would you like to Delete This Sale", preferredStyle: UIAlertController.Style.alert)

              
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {action in
            self.deletesaleAPi()
        }))
               alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

              
               self.present(alert, animated: true, completion: nil)
    }
    
    func deletesaleAPi() {
        ShareData.showProgress()
        let dic : [String: Any] = ["sale_id": id]
        userhandler.deleteSale(params:dic , Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                self.navigationController?.popViewController(animated: true)
            } else {
                 ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
             ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
}
