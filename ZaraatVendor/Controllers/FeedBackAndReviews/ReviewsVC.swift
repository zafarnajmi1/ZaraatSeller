//
//  ReviewsVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/18/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ReviewsVC: UIViewController {

    @IBOutlet weak var tblview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User's Reviews"
        
        tblview.rowHeight = UITableView.automaticDimension

        tblview.estimatedRowHeight = 140
        tblview.tableFooterView = UIView(frame: .zero)
        addBackButton()
        self.tblview.register(UINib.init(nibName: "ReviewsCell", bundle: nil), forCellReuseIdentifier: "ReviewsCell")
    }
    

    

}
extension ReviewsVC :  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,heightForRowAt indexPath:IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }

//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//     return 100
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ReviewsCell") as? ReviewsCell
        return cell!
    }
    
    
}
