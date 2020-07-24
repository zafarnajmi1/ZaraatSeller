//
//  ChatVC.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 25/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var tbView: UITableView!{
        didSet{
            tbView.estimatedRowHeight = 89
            tbView.rowHeight = UITableView.automaticDimension
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chat"
        addBackButton()
    }
    

    

}
extension ChatVC:  UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 3 {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "SenderTxtCell") as? SenderTxtCell
        return cell!
        } else {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "RecieverTxtCell") as? RecieverTxtCell
            return cell!
        }
    }
    
    
}
