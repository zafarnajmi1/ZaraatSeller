//
//  CouponsListVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DZNEmptyDataSet
class CouponsListVC: UIViewController,manageCoupon {
    
    

    @IBOutlet weak var tblView: UITableView!
    
    
    
    var couponList = [Coupons]()
    
    var couponid = 0
    fileprivate func setupDelegates(){
        self.tblView.emptyDataSetSource = self as DZNEmptyDataSetSource
        self.tblView.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
        self.tblView.tableFooterView = UIView()
        self.tblView.reloadData()
    }
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
                if self.couponList.count == 0 {
                    self.setupDelegates()
                }
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
extension CouponsListVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Sorry there is no data available"
        let attribs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 19),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        let text = "Try Again!"
        let attribs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5818647146, green: 0.8263530135, blue: 0.2647219598, alpha: 1)
            ] as [NSAttributedString.Key : Any] as [NSAttributedString.Key : Any]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
        func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!){
           getCouponsList()
           
        }
    
    
    
    
}
