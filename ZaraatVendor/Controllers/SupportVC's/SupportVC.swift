//
//  SupportVC.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 29/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SupportVC: UIViewController {
    @IBOutlet weak var tblView: UITableView!
    var titleArr = ["Contact Through Mail : support@zaraat.com","Contact Through Phone : 042-35787542"]
    var imageArr = [UIImage.init(named:"email-1" ),UIImage.init(named:"Phone-1" )] 
    override func viewDidLoad() {
        super.viewDidLoad()
//        UIView.animate(withDuration: 0.1, animations: {
//            self.tabBarController?.tabBar.isHidden = true
//        })
        tblView.tableFooterView = UIView(frame: .zero)
        tblView.register(UINib.init(nibName: "SupportCell", bundle: nil), forCellReuseIdentifier: "SupportCell")
        self.title = "Support"
        addBackButton()
    }
    

    

}
extension SupportVC : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SupportCell") as? SupportCell
        cell?.lbltitl.text = titleArr[indexPath.row]
        cell?.img.image = imageArr[indexPath.row]
        return cell!
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
    
}
