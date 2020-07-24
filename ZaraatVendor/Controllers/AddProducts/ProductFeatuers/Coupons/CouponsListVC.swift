//
//  CouponsListVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class CouponsListVC: UIViewController,manageCoupon {
    
    

    @IBOutlet weak var tblView: UITableView!
    
    
    
    var couponList = [Coupons]()
    
    var couponid = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.tblView.tableFooterView =  UIView.init(frame: .zero)
        self.title = "Coupons List"
        self.addBackButton()
        tblView.register(UINib.init(nibName: "CouponsListCell", bundle: nil), forCellReuseIdentifier: "CouponsListCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCouponsList()
    }
    
    
    func couponMange(cell: CouponsListCell) {
        let indx = tblView.indexPath(for: cell)
        self.couponid =  self.couponList[indx!.row].coupon_id!
        moveonEdit()
    }

    func moveonEdit() {
        
            if UIDevice.current.userInterfaceIdiom == .pad {
             
                     let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                     let vc =  storyBoard.instantiateViewController(withIdentifier: "AddCouponVC") as? AddCouponVC
                         vc?.checktype = false
                         
                        vc?.couponid =  self.couponid
                     self.navigationController?.pushViewController(vc!, animated: true)

             } else {

                     let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                     let vc =  storyBoard.instantiateViewController(withIdentifier: "AddCouponVC") as? AddCouponVC
                         vc?.checktype = false
                        vc?.couponid =  self.couponid
                     self.navigationController?.pushViewController(vc!, animated: true)
             }
    }
    
    
    
    
    func getCouponsList(){
        
        ShareData.showProgress()
        userhandler.couponsList(Success: {Response in
             ShareData.hideProgress()
            if Response.success == 1 {
                self.couponList =  Response.coupons ?? []
                self.tblView.reloadData()
            } else {
                 ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: Response.message!, messagetype: 0)
            }
        }, Failure: {error in
             ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func addCouponAction(_ sender: UIButton) {
        
        
        if UIDevice.current.userInterfaceIdiom == .pad {
                    
                            let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                            let vc =  storyBoard.instantiateViewController(withIdentifier: "AddCouponVC") as? AddCouponVC
                                vc?.checktype = true
                            self.navigationController?.pushViewController(vc!, animated: true)

                    } else {

                            let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                            let vc =  storyBoard.instantiateViewController(withIdentifier: "AddCouponVC") as? AddCouponVC
                           vc?.checktype = true
                                
                            self.navigationController?.pushViewController(vc!, animated: true)
                    }
    }
    
    
    
    
    
    
}
extension CouponsListVC:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.couponList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CouponsListCell") as? CouponsListCell
        cell?.delegate  = self
        cell?.lbldate.text = "Expiry Date : " +  (self.couponList[indexPath.row].end_date ?? "")
        cell?.lblprice.text = "Price :" + (self.couponList[indexPath.row].coupon_value ?? "")  + "PKR"
         cell?.lbltitle.text = self.couponList[indexPath.row].coupon_tittle
        
        
        return cell!
    }
    
    
}
