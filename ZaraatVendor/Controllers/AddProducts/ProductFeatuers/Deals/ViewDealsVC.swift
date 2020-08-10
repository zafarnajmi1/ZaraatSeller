//
//  ViewDealsVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DZNEmptyDataSet
class ViewDealsVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var deallist = [Deals]()
    
    
    fileprivate func setupDelegates(){
        self.tblView.emptyDataSetSource = self as DZNEmptyDataSetSource
        self.tblView.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
        self.tblView.tableFooterView = UIView()
        self.tblView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Deals List"
        self.addBackButton()
        tblView.register(UINib.init(nibName: "DealViewCell", bundle: nil), forCellReuseIdentifier: "DealViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dealLitApi()
    }

    @IBAction func createdealAction(_ sender: UIButton) {
        if UIDevice.current.userInterfaceIdiom == .pad {
                      
                      let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                      let vc =  storyBoard.instantiateViewController(withIdentifier: "AddDealVC") as? AddDealVC
                       vc?.checktype =   true
                      self.navigationController?.pushViewController(vc!, animated: true)

                      } else {

                      let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                      let vc =  storyBoard.instantiateViewController(withIdentifier: "AddDealVC") as? AddDealVC
                          vc?.checktype =   true 
                      self.navigationController?.pushViewController(vc!, animated: true)
                      }
        
    }
    
    
    func dealLitApi() {
        ShareData.showProgress()
        userhandler.dealList(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.deallist =  response.deals ?? []
                if self.deallist.count == 0 {
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

}
extension ViewDealsVC : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.deallist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "DealViewCell") as? DealViewCell
        let obj = deallist[indexPath.row]
        cell?.SetaData(obj:obj )
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       if UIDevice.current.userInterfaceIdiom == .pad {
       
       let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
       let vc =  storyBoard.instantiateViewController(withIdentifier: "DealDetailVC") as? DealDetailVC
        vc?.dealid = deallist[indexPath.row].deals_id ?? 0
       self.navigationController?.pushViewController(vc!, animated: true)

       } else {

       let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
       let vc =  storyBoard.instantiateViewController(withIdentifier: "DealDetailVC") as? DealDetailVC
           vc?.dealid = deallist[indexPath.row].deals_id ?? 0
       self.navigationController?.pushViewController(vc!, animated: true)
       }
    }
    
}
extension ViewDealsVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
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
           dealLitApi()
           
        }
    
    
    
    
}
