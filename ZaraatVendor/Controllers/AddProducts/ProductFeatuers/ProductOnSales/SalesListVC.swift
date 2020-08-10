//
//  SalesListVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DZNEmptyDataSet
class SalesListVC: UIViewController {
    
 @IBOutlet weak var tblView: UITableView!
    
    var saleList = [Sales]()
    var productid  = 0
    
    fileprivate func setupDelegates(){
        self.tblView.emptyDataSetSource = self as DZNEmptyDataSetSource
        self.tblView.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
        self.tblView.tableFooterView = UIView()
        self.tblView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.tableFooterView =  UIView.init(frame: .zero)
        self.title = "Sales List"
        self.addBackButton()
         tblView.register(UINib.init(nibName: "SalesListCell", bundle: nil), forCellReuseIdentifier: "SalesListCell")
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        saleListApi()
    }
    
    
    func saleListApi(){
        ShareData.showProgress()
        userhandler.saleList(Success: {response in
            ShareData.hideProgress()
            if response.success ==  1 {
                self.saleList =  response.sales ?? []
                if self.saleList.count == 0 {
                    self.setupDelegates()
                }
                self.tblView.reloadData()
            } else {
                ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    
    
    
    
    
    
    

    @IBAction func addSaleAction(_ sender: UIButton) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
             
             let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
             let vc =  storyBoard.instantiateViewController(withIdentifier: "AddSaleVC") as? AddSaleVC
                 vc?.checktype =  true
            vc?.productid = productid
             self.navigationController?.pushViewController(vc!, animated: true)

             } else {

             let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
             let vc =  storyBoard.instantiateViewController(withIdentifier: "AddSaleVC") as? AddSaleVC
                 vc?.checktype =  true
             vc?.productid = productid
             self.navigationController?.pushViewController(vc!, animated: true)
             }
        
    }
    

}
extension SalesListVC : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.saleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "SalesListCell") as? SalesListCell
        let obj = saleList[indexPath.row]
        cell?.setdata(obj: obj)
//        print(saleList[indexPath.row].produt?.image?[0].file_path)
//        //cell?.img.setPath(string: saleList[0].produt?.image?[0].file_path, "Grey Logo")
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       if UIDevice.current.userInterfaceIdiom == .pad {
       
       let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
       let vc =  storyBoard.instantiateViewController(withIdentifier: "ViewProductOnSale") as? ViewProductOnSale
           vc?.saleid = saleList[indexPath.row].onsale_id!
       self.navigationController?.pushViewController(vc!, animated: true)

       } else {

       let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
       let vc =  storyBoard.instantiateViewController(withIdentifier: "ViewProductOnSale") as? ViewProductOnSale
        vc?.saleid = saleList[indexPath.row].onsale_id!
       self.navigationController?.pushViewController(vc!, animated: true)
       }
    }
    
}
extension SalesListVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
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
           saleListApi()
           
        }
    
    
    
    
}
