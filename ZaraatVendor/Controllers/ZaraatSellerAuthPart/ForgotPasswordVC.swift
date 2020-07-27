//
//  ForgotPasswordVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/27/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ForgotPasswordVC: BaseVC {

   

        @IBOutlet weak var btnNext: UIButton!
        @IBOutlet weak var emailView: UIView!
        @IBOutlet weak var txtemail: UITextField!
        var id = 0
        override func viewDidLoad() {
            super.viewDidLoad()
            emailView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
            btnNext.roundbuttonRadius(borderwidth: 2)
            //addShadow(to: [.top,.bottom,.left,.right], radius: 5.0)//addInerShadowLayer()
        }
        
        @IBAction func nextAction(_ sender: UIButton) {
            
            if cehckDate(){
              forgotpasswordApi()
            }
        
        }
        
        
        @IBAction func backtoSignin(_ sender: UIButton) {
            self.navigationController?.popViewController(animated: true)
            
    //        if UIDevice.current.userInterfaceIdiom == .pad {
    //
    //              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
    //              let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
    //              self.navigationController?.pushViewController(vc!, animated: true)
    //
    //       } else {
    //
    //              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
    //              let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
    //              self.navigationController?.pushViewController(vc!, animated: true)
    //           }
            
            
        
        }
        
        
        func cehckDate() ->Bool {
            if txtemail.text == "" {
               Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Email", messagetype: 0)
                return false
            }
            return true
        }
        
        
        func forgotpasswordApi() {
            let dic : [String:Any] = ["email": txtemail.text!]
            ShareData.showProgress()
            userhandler.forgotPassword(params: dic, Success: {response in
                 ShareData.hideProgress()
                if response.success ==  1 {
                    self.id =  (response.user?.vendor_id)!
                    self.movenext()
                    self.id =  (response.user?.vendor_id)!
                    Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                } else {
                     ShareData.hideProgress()
                    Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
                }
            }, Failure: {error in
                 ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
            })
        }
    //
        
        func movenext(){
            if UIDevice.current.userInterfaceIdiom == .pad {
                              
                          let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                          let vc =  storyBoard.instantiateViewController(withIdentifier: "CodeVerificationVC") as? CodeVerificationVC
                vc!.id = id
                          self.navigationController?.pushViewController(vc!, animated: true)
                          
                   } else {
                          
                          let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                          let vc =  storyBoard.instantiateViewController(withIdentifier: "CodeVerificationVC") as? CodeVerificationVC
                vc!.id = id
                          self.navigationController?.pushViewController(vc!, animated: true)
                       }
        }
    }
