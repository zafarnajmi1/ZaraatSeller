//
//  InquiresVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
import  DZNEmptyDataSet
class InquiresVC: UIViewController,IndicatorInfoProvider,InquiriesReply {
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "INQUIRES")
    }
    
    
    
    fileprivate func setupDelegates(){
           self.tblview.emptyDataSetSource = self as DZNEmptyDataSetSource
           self.tblview.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
           self.tblview.tableFooterView = UIView()
           self.tblview.reloadData()
       }
       
    
    
    var enquriesData : [Enquiries]?
    
    var refreshControl = UIRefreshControl()

       @IBOutlet weak var tblview: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            tblview.register(UINib.init(nibName: "InquiresCell", bundle: nil), forCellReuseIdentifier: "InquiresCell")
             refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
                  refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
                  tblview.addSubview(refreshControl)
            
            getAllEnquires()
        }
    
    
    
        @objc func refresh() {
            refreshControl.endRefreshing()
            print("Iam Fresh")
        }
    
    
    func replyinquireis(cell: InquiresCell) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InquiriesReplyVC") as! InquiriesReplyVC
       
        vc.modalPresentationStyle = .currentContext
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        vc.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
        self.present(vc, animated: true, completion: nil)
    }
    
    
    func getAllEnquires(){
        ShareData.showProgress()
        userhandler.getMyallEnquires(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.enquriesData = response.enquiries ?? []
                
                if self.enquriesData?.count == 0 {
                    self.setupDelegates()
                }
                self.tblview.reloadData()
            } else {
                self.alertMessage(message: response.message ?? "", completionHandler: {})
                ShareData.hideProgress()
            }
        }, Failure: {error in
            self.alertMessage(message: error.message , completionHandler: {})
            ShareData.hideProgress()
        })
    }
    
    

    }
    extension InquiresVC : UITableViewDelegate , UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.enquriesData?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "InquiresCell") as?  InquiresCell
            
            cell?.lblname.text = self.enquriesData?[indexPath.row].customer?.first_name
            cell?.lblmsg.text = self.enquriesData?[indexPath.row].message
            cell?.lbldate.text = formatedDateted(string:(self.enquriesData?[indexPath.row].updated_at)! )
            cell?.delegate =  self
            return cell!
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ClientMessageVC") as! ClientMessageVC
            vc.enquiresDetail = enquriesData![indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
extension InquiresVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
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
            getAllEnquires()
           
        }
    
    
    
    
}
