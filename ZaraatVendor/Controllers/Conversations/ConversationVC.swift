//
//  ConversationVC.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 24/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ConversationVC: UIViewController {

    @IBOutlet weak var tbView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Conversation"
        UIView.animate(withDuration: 0.1, animations: {
            self.tabBarController?.tabBar.isHidden = true
        })
             addBackButton()
        tbView.register(UINib.init(nibName: "ConversationCell", bundle: nil), forCellReuseIdentifier: "ConversationCell")
    }
    

}
extension ConversationVC: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ConversationCell") as? ConversationCell
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ChatVC") as? ChatVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ChatVC") as? ChatVC
        self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
//     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            //objects.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }     }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            // Delete the row from the data source
//            self.cafeNames.remove(at: indexPath.row)
//            self.cafeLocations.remove(at: indexPath.row)
//            self.cafeIsVisited.remove(at: indexPath.row)
//            self.cafeTypes.remove(at: indexPath.row)
//            self.cafeImages.remove(at: indexPath.row)
            
            //self.tbView.deleteRows(at: [indexPath], with: .fade)
            
            // Call completion handler to dismiss the action button
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "More") { (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at "
            
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: "message") {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.3294117647, blue: 0.168627451, alpha: 1) //UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        shareAction.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.7098039216, blue: 0.7137254902, alpha: 1)//UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "doted")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
    }
    
//     func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let checkInAction = UIContextualAction(style: .normal, title: "Check-in") { (action, sourceView, completionHandler) in
//            let cell = tableView.cellForRow(at: indexPath) as! ConversationCell
////            self.cafeIsVisited[indexPath.row] = (self.cafeIsVisited[indexPath.row]) ? false : true
////            cell.accessoryType = (self.cafeIsVisited[indexPath.row]) ? .checkmark : .none
//
//            completionHandler(true)
//        }
//
//        // Customize the action button
//        checkInAction.backgroundColor = UIColor(red: 39.0/255.0, green: 174.0/255.0, blue: 96.0/255.0, alpha: 1.0)
//        //checkInAction.image = self.cafeIsVisited[indexPath.row] ? UIImage(named: "undo") : UIImage(named: "tick")
//
//        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
//
//        return swipeConfiguration
//    }
    
    
    
    
    
}
