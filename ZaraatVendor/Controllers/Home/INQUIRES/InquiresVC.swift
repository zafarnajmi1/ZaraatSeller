//
//  InquiresVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  XLPagerTabStrip

class InquiresVC: UIViewController,IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "INQUIRES")
    }
    var refreshControl = UIRefreshControl()

       @IBOutlet weak var tblview: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            tblview.register(UINib.init(nibName: "InquiresCell", bundle: nil), forCellReuseIdentifier: "InquiresCell")
             refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
                  refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
                  tblview.addSubview(refreshControl)
        }
        @objc func refresh() {
            print("Iam Fresh")
        }


    }
    extension InquiresVC : UITableViewDelegate , UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 12
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "InquiresCell") as?  InquiresCell
            return cell!
        }
        
        
    }
