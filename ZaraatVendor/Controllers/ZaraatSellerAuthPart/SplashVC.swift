//
//  SplashVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/27/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SplashVC: BaseVC {

    override func viewDidLoad() {
            super.viewDidLoad()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.CheckLogin()
            }
        }

        func moveOnLogin(){
            if UIDevice.current.userInterfaceIdiom == .pad {
                
            let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
            let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
            self.navigationController?.pushViewController(vc!, animated: true)
            
            } else {
            
            let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
            let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
            self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
        
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
        func CheckLogin() {
            if ShareData.shareInfo.autologin == true  {
                LoginVendor()
            } else {
               moveOnLogin()
            }
        }
        
        func LoginVendor() {
    
                  let dic : [String:Any] = ["email" : ShareData.shareInfo.email!,"password":ShareData.shareInfo.password!]
               ShareData.showProgress()
                  userhandler.login(parms: dic, Success: {response in
                    ShareData.hideProgress()
                      ShareData.hideProgress()
                      if response.success == 1{
                       ShareData.shareInfo.userInfo = response
    
                       if response.vendors?.status == 0 {
                           self.moveOnBusinessProfile()
                       }else {
                            self.movetoHome()
                       }
    
                          //Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                      }else {
                        ShareData.hideProgress()
                          ShareData.hideProgress()
                          Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
                      }
    
                  }, Failure: {error in
                      ShareData.hideProgress()
                      Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
                  })
              }
           
           
           func movetoHome(){
               if UIDevice.current.userInterfaceIdiom == .pad {

                       let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                       let vc =  storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
                       self.navigationController?.pushViewController(vc!, animated: true)

               } else {

                       let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                       let vc =  storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
                       self.navigationController?.pushViewController(vc!, animated: true)
               }
           }
           
           func moveOnBusinessProfile(){
               if UIDevice.current.userInterfaceIdiom == .pad {
    
                       let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                       let vc =  storyBoard.instantiateViewController(withIdentifier: "VendorPackageVC") as? VendorPackageVC
                       self.navigationController?.pushViewController(vc!, animated: true)
    
               } else {
    
                       let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                       let vc =  storyBoard.instantiateViewController(withIdentifier: "VendorPackageVC") as? VendorPackageVC
                       self.navigationController?.pushViewController(vc!, animated: true)
               }
           }
           
           
           
           
           

}
