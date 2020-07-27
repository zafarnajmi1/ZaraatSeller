//
//  MyAccountVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class MyAccountVC: UIViewController {

    @IBOutlet weak var lblyears: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    @IBOutlet weak var userimg: UIImageView!
    @IBOutlet weak var tblView: UITableView!
    
    struct menu {
        var title: String?
        var img: UIImage?
    }
    
    var menuArray = [menu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Account"
        self.userimg.roundImg()
        tblView.register(UINib.init(nibName: "MyCccountCell", bundle: nil), forCellReuseIdentifier: "MyCccountCell")
        tblView.register(UINib.init(nibName: "CompleteProfileCell", bundle: nil), forCellReuseIdentifier: "CompleteProfileCell")
        
        self.userimg.setPath(string: ShareData.shareInfo.userInfo?.vendors?.logo, "username")
        
        self.lblemail.text = ShareData.shareInfo.userInfo?.vendors?.email
        self.lblusername.text =  ShareData.shareInfo.userInfo?.vendors?.owners_name
       configMenu()
         getcurrentpkgApi()
    }
    
    
    
    
    func getcurrentpkgApi() {
        userhandler.getCurrentPkgs(Success: {response in
            self.lblyears.text = response.my_package?.package_name
        }, Failure: {error in
            
        })
    }
    
    
    
    
    
    
    func configMenu() {
        
        menuArray.removeAll()
        menuArray.append(menu(title: "Manage Your Business Profile", img: UIImage.init(named: "tradecenter")))
        menuArray.append(menu(title: "Notification System", img: UIImage.init(named: "notification")))
        menuArray.append(menu(title: "Change Password", img: UIImage.init(named: "changepassword")))
        menuArray.append(menu(title: "Switch Language", img: UIImage.init(named: "switchlanguage")))
        menuArray.append(menu(title: "Upgrade Account", img: UIImage.init(named: "upgradeaccount")))
        menuArray.append(menu(title: "Help Center", img: UIImage.init(named: "helpcenter-1")))
        menuArray.append(menu(title: "Reviews And Feedback Of Products", img: UIImage.init(named: "reviewandfeedback")))
        menuArray.append(menu(title: "Learn More", img: UIImage.init(named: "learnmore-1")))
        menuArray.append(menu(title: "Log Out", img: UIImage.init(named: "logout-1")))
    }

    
    @IBAction func profileAction(_ sender: UIButton) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "ViewProfileVC") as? ViewProfileVC
            vc?.hidesBottomBarWhenPushed =  true
              self.navigationController?.pushViewController(vc!, animated: true)

        } else {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "ViewProfileVC") as? ViewProfileVC
              vc?.hidesBottomBarWhenPushed =  true
              self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        
    }
    
}

extension MyAccountVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompleteProfileCell") as? CompleteProfileCell
//                   cell?.lbltitle.text = menuArray[indexPath.row].title
//                   cell?.icon.image = menuArray[indexPath.row].img
            return cell!
        } else {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCccountCell") as? MyCccountCell
        cell?.lbltitle.text = menuArray[indexPath.row].title
        cell?.icon.image = menuArray[indexPath.row].img
        return cell!
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indx =  indexPath.row
        
        switch indx {
        case 0:
           moveOnBusinProfile()
        case 2:
            moveOnChangePAssword()
        case 4 :
            moveOnPkgs()
        case 5:
            moveOnSupport()
        case 6:
           
           
            moveOnFeedBack()
        case 8:
          alertForLogout()
        default:
            break
        }
        
        
        
    }
    
    
    
    
    
    
    
    
 
    
    
    
    func moveOnSupport() {
        if UIDevice.current.userInterfaceIdiom == .pad {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "SupportVC") as? SupportVC
              
           
              self.navigationController?.pushViewController(vc!, animated: true)

        } else {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "SupportVC") as? SupportVC
               
           
              self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    
    
    
    
    
    
    func moveOnChangePAssword() {
          if UIDevice.current.userInterfaceIdiom == .pad {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "RestPasswordVC") as? RestPasswordVC
                
             
                self.navigationController?.pushViewController(vc!, animated: true)

          } else {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "RestPasswordVC") as? RestPasswordVC
                 
             
                self.navigationController?.pushViewController(vc!, animated: true)
          }
          
      }
    
    
    func moveOnPkgs() {
        if UIDevice.current.userInterfaceIdiom == .pad {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "MainPakAgesVC") as? MainPakAgesVC
              
           
              self.navigationController?.pushViewController(vc!, animated: true)

        } else {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "MainPakAgesVC") as? MainPakAgesVC
               
           
              self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
        
    func moveOnBusinProfile() {
        if UIDevice.current.userInterfaceIdiom == .pad {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "VendorPackageVC") as? VendorPackageVC
               vc!.fromMyaccount =  true
            vc?.hidesBottomBarWhenPushed =  true
              self.navigationController?.pushViewController(vc!, animated: true)

        } else {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "VendorPackageVC") as? VendorPackageVC
               vc!.fromMyaccount =  true
            vc?.hidesBottomBarWhenPushed =  true
              self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    func alertForLogout() {
        let alert = UIAlertController(title: "Alert", message: "Are You Sure You Want To LogOut?", preferredStyle: UIAlertController.Style.alert)

        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
            self.LogoutApi()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

       
        self.present(alert, animated: true, completion: nil)
    }
    
    func LogoutApi () {
        ShareData.showProgress()
        userhandler.Logout(Success: {response in
            ShareData.hideProgress()
            if  response.success == 1 {
            self.moveOnLogin()
            ShareData.shareInfo.email = nil
            ShareData.shareInfo.password = nil
             ShareData.shareInfo.autologin =  false
             ShareData.shareInfo.userInfo = nil
            } else {
                 ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
  
        }, Failure: {error in
             ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    func moveOnLogin() {
           if UIDevice.current.userInterfaceIdiom == .pad {

                 let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                 let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
            hidesBottomBarWhenPushed =  true
                 self.navigationController?.pushViewController(vc!, animated: true)

           } else {

                 let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                 let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
                 hidesBottomBarWhenPushed =  true
                 self.navigationController?.pushViewController(vc!, animated: true)
           }
           
       }
    
    func moveOnFeedBack() {
              if UIDevice.current.userInterfaceIdiom == .pad {

                    let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                    let vc =  storyBoard.instantiateViewController(withIdentifier: "FeedBackVC") as? FeedBackVC
               
                    self.navigationController?.pushViewController(vc!, animated: true)

              } else {

                    let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                    let vc =  storyBoard.instantiateViewController(withIdentifier: "FeedBackVC") as? FeedBackVC
                    
                    self.navigationController?.pushViewController(vc!, animated: true)
              }
              
          }
    
    
    
    
    
    
    
    
    
    
    
}
