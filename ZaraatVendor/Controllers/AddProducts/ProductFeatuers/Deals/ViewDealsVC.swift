//
//  ViewDealsVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewDealsVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var deallist = [Deals]()
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
