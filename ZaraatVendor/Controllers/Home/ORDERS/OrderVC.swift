//
//  OrderVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
class OrderVC: UIViewController,IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "ORDERS")
    }
    
    var refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tblview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblview.register(UINib.init(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: "OrderCell")
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        tblview.addSubview(refreshControl)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)

    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        refresh()
        print("Iam Notification")
    }
    
    
    @objc func refresh() {
        refreshControl.endRefreshing()
        print("Iam Fresh")
    }

}
extension OrderVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell") as?  OrderCell
        return cell!
    }
    
    
}
