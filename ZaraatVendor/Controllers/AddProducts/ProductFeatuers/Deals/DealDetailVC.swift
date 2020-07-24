//
//  DealDetailVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class DealDetailVC: UIViewController {
    @IBOutlet weak var lblendDate: UILabel!
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var deleteView: UIView!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblstartDate: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lbldealname: UILabel!
    @IBOutlet weak var dealimg: UIImageView!
    @IBOutlet weak var tblheight: NSLayoutConstraint!
    var dealid = 0
    var dealDetail : DealDeatilDeal?
    var  dealproducts = [Deal_products]()
    var videourl : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title  = "Deal Detail"
        addBackButton()
         self.tblView.tableFooterView =  UIView.init(frame: .zero)
        editView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        deleteView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        videoView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        self.tblView.register(UINib.init(nibName: "DealDetailsCell", bundle: nil), forCellReuseIdentifier: "DealDetailsCell")
        dealDetailApi()
    }

    
    
    
    func dealDetailApi(){
        ShareData.showProgress()
        userhandler.getSinglDeal(id: dealid, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.dealDetail = response.deal
                
                self.lblprice.text =  "Price :" +  (response.deal?.deal_price)!
                self.lblendDate.text = "End Date :" + (response.deal?.deal_end_date)!
                
                self.lblstartDate.text = "Start Date :" +  (response.deal?.deal_start_date)!

                  self.lbldealname.text = response.deal?.deal_title_en
                self.dealimg.setPath(string: response.deal?.deal_image ?? "", "Grey Logo")
                
                self.videourl = URL(string: response.deal?.deal_video ?? "")
                
                
                
                self.dealproducts = response.deal_products ?? []
                
                self.tblView.reloadData()
                self.setViewHeight()
            } else {
                ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    
    private func setViewHeight(){
        var tableViewHeight:CGFloat = 0
        for i in 0..<self.tblView.numberOfRows(inSection: 0){
            tableViewHeight = tableViewHeight + tableView(self.tblView, heightForRowAt: IndexPath(row: i, section: 0))
        }
        tblheight.constant = tableViewHeight + 30
        self.tblView.setNeedsDisplay()
    }
    
    @IBAction func editAction(_ sender: UIButton) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "AddDealVC") as? AddDealVC
            vc?.dealid =  self.dealid
            vc?.checktype =   false
        self.navigationController?.pushViewController(vc!, animated: true)

        } else {

        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "AddDealVC") as? AddDealVC
            vc?.dealid =  self.dealid
            vc?.checktype =   false
        self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        
        
        let alert = UIAlertController(title: "Alert", message: "Would you like to Delete This Deal", preferredStyle: UIAlertController.Style.alert)

                     
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {action in
            self.deleteDealApi()
        }))
                      alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

                     
                      self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    func deleteDealApi(){
        ShareData.showProgress()
        let dic : [String : Any] = ["deal_id": dealid]
        userhandler.deleteDeal(params:dic , Success: {response in
            ShareData.hideProgress()
            if response.success ==  1 {
             
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                self.navigationController?.popViewController(animated: true)
            } else {
                ShareData.hideProgress()
                           Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error  in
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    
    
    
    @IBAction func videoAction(_ sender: UIButton) {
        
                  guard let assetURL = videourl  else {return}
                 let playerVC = AVPlayerViewController()
                 let player = AVPlayer(playerItem: AVPlayerItem(url:assetURL))
                 playerVC.player = player
                self.present(playerVC, animated: true, completion: nil)
    }
    
}
extension DealDetailVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dealproducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "DealDetailsCell") as? DealDetailsCell
        let obj = dealproducts[indexPath.row]
        cell?.setdate(obj: obj)
        return cell!
    }
    
    
}
