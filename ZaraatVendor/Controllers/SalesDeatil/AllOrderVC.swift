//
//  AllOrderVC.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 27/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
class AllOrderVC: UIViewController,IndicatorInfoProvider {
    @IBOutlet weak var tblView: UITableView!
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "ALL ORDER")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Orders"
     addBackButton()
        setNavigationBar()
        UIApplication.shared.setStatusBar()
        tblView.register(UINib.init(nibName: "AllOrderCell", bundle: nil), forCellReuseIdentifier: "AllOrderCell")
    }
    

    

}
extension AllOrderVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllOrderCell") as? AllOrderCell
        return cell!
    }
    
    
}
