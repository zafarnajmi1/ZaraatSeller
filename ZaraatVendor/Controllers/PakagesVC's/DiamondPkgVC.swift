//
//  DiamondPkgVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
class DiamondPkgVC: UIViewController , IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Diamond")
    }
    
    @IBOutlet weak var btnupgrade: UIButton!
    var packages : [Packages]?
    
    @IBOutlet weak var tblView: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            btnupgrade.layer.cornerRadius = 8
            tblView.register(UINib.init(nibName: "PkgsCell", bundle: nil), forCellReuseIdentifier: "PkgsCell")
        }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getpkgsapi()
    }
    func  getpkgsapi(){
           ShareData.showProgress()
           userhandler.getPkgs(Success: {response in
                 ShareData.hideProgress()
               if response.success == 1 {
                   self.packages = response.packages ?? []
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
       
    @IBAction func upgradeAction(_ sender: UIButton) {
        if UIDevice.current.userInterfaceIdiom == .pad {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "PkgDetailVC") as? PkgDetailVC
            vc?.pkgid = (packages?[4].package_id)!
        self.navigationController?.pushViewController(vc!, animated: true)

        } else {

        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "PkgDetailVC") as? PkgDetailVC
         vc?.pkgid = (packages?[4].package_id)!
        self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    }
    extension DiamondPkgVC : UITableViewDelegate,UITableViewDataSource {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                   return 420
               }
        func numberOfSections(in tableView: UITableView) -> Int {
                   return 1
               }
               func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return 1
               }
               
              func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                   let cell =  tableView.dequeueReusableCell(withIdentifier: "PkgsCell") as? PkgsCell
                cell?.lblprice.text = "PKR " +  (packages?[4].price ?? "")   + " / Year"
                cell?.lblshowcase.text =   (packages?[4].showcase_products ?? "")
                cell?.lblAccounts.text =  (packages?[4].sub_accounts ?? "")
                cell?.lblValidity.text =  (packages?[4].account_validity ?? "")
                cell?.lblads.text =  "\(packages?[4].ads_number ?? 0)"
                   
                if packages?[4].conference_workshop ==  1 {
                   cell?.lblworkshops.text =  "Yes"
                   } else {
                       cell?.lblworkshops.text = "No"
                   }
                   
                if packages?[4].inquiries == 1 {
                       cell?.lblEnquiries.text =  "Yes"
                   } else {
                       cell?.lblEnquiries.text =  "No"
                   }
                   
                if packages?[4].reporting ==  1 {
                       cell?.lblreporting.text =  "Yes"
                   } else {
                       cell?.lblreporting.text =  "No"
                   }
                   
                   
                if packages?[0].verification == 1 {
                       cell?.lblVerification.text =  "Yes"
                   } else {
                       cell?.lblVerification.text =  "No"
                   }
                   
                   
                if packages?[0].marketing == 1 {
                       cell?.lblMarketing.text =  "Yes"
                   } else {
                       cell?.lblMarketing.text =  "No"
                   }
                   return cell!
               }
               
        
        
    }
