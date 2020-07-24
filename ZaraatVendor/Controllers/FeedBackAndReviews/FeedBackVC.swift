//
//  FeedBackVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/18/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class FeedBackVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FeedBack"
        tblView.tableFooterView = UIView(frame: .zero)
        addBackButton()
        self.tblView.register(UINib.init(nibName: "FeedCell", bundle: nil), forCellReuseIdentifier: "FeedCell")
    }
    

    

}
extension FeedBackVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveOnRevies()
    }
    
    func moveOnRevies() {
        if UIDevice.current.userInterfaceIdiom == .pad {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "ReviewsVC") as? ReviewsVC
         
              self.navigationController?.pushViewController(vc!, animated: true)

        } else {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "ReviewsVC") as? ReviewsVC
              
              self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
}
