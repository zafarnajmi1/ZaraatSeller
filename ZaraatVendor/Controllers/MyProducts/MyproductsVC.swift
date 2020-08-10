//
//  MyproductsVC.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 31/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DZNEmptyDataSet
class MyproductsVC: UIViewController,manageProduct {
    
    
    
    

    @IBOutlet weak var btnaddproduct: UIButton!
    @IBOutlet weak var mainVoew: UIView!
    @IBOutlet weak var tblView: UITableView!
    var productsList = [Products]()
    
    
    var refreshControl: UIRefreshControl!
    
    fileprivate func setupDelegates(){
        self.tblView.emptyDataSetSource = self as DZNEmptyDataSetSource
        self.tblView.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
        self.tblView.tableFooterView = UIView()
        self.tblView.reloadData()
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
       self.navigationController?.navigationBar.isHidden =  false
        setNavigationBar()
        UIApplication.shared.setStatusBar()
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tblView.addSubview(refreshControl)
        tblView.tableFooterView = UIView(frame: .zero)
        
        self.title = "My Products"
        self.addBackButton()
        btnaddproduct.roundButton()
        mainVoew.viewSetUp(radius: Int(mainVoew.layer.frame.height / 2), color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), borderwidth: 1)
        tblView.register(UINib.init(nibName: "MyProductCell", bundle: nil), forCellReuseIdentifier: "MyProductCell")
        UIView.animate(withDuration: 0.1, animations: {
            self.tabBarController?.tabBar.isHidden = true
        })
    
//        self.getProductApi()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getProductApi()
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    @objc func refresh(_ sender: Any) {
           
           getProductApi()
       }
    
    
    @IBAction func addproductcAction(_ sender: UIButton) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
                   
               let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
               let vc =  storyBoard.instantiateViewController(withIdentifier: "AddProductVC") as? AddProductVC
                 vc?.checktype =  false
               self.navigationController?.pushViewController(vc!, animated: true)
               
               } else {
               
               let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
               let vc =  storyBoard.instantiateViewController(withIdentifier: "AddProductVC") as? AddProductVC
                 vc?.checktype =  false
            
               self.navigationController?.pushViewController(vc!, animated: true)
               }
        
        
    }
    
    
    
    func getProductApi() {
        ShareData.showProgress()
        userhandler.getVendorProducts(Success: {response in
            self.refreshControl.endRefreshing()
             ShareData.hideProgress()
            if  response.success == 1 {
                self.productsList = response.products ?? []
                if self.productsList.count == 0 {
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
    
    
    func productManage(cell: MyProductCell) {
        let indx =  tblView.indexPath(for: cell)
        
        
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ManageProductVC") as? ManageProductVC
            vc?.productId = productsList[indx!.row].products_id ?? 0
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ManageProductVC") as? ManageProductVC
            vc?.productId = productsList[indx!.row].products_id ?? 0
            
        self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
}
extension MyproductsVC : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyProductCell") as? MyProductCell
        let objc = productsList[indexPath.row]
        cell!.setData(obj:objc )
        cell?.Delegate = self
        return cell!
    }
    
    
}
extension MyproductsVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
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
            getProductApi()
           
        }
    
    
    
    
}
