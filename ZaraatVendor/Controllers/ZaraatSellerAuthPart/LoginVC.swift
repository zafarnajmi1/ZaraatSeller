//
//  LoginVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/27/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  SkyFloatingLabelTextField
class LoginVC: BaseVC,UITextFieldDelegate {

//        @IBOutlet weak var passwordView: UIView!
//        @IBOutlet weak var emailView: UIView!
        @IBOutlet weak var txtpassword: UITextField!
        @IBOutlet weak var btnlogin: UIButton!
        
       @IBOutlet weak var btnpass: UIButton!
    @IBOutlet weak var txtlogin: SkyFloatingLabelTextFieldWithIcon!
    var passClick = true 
        
   // @IBOutlet weak var txtemail: UITextField!
    
        var textFields: [SkyFloatingLabelTextField] = []

           let lightGreyColor: UIColor = UIColor(red: 197 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1.0)
           let darkGreyColor: UIColor = UIColor(red: 52 / 255, green: 42 / 255, blue: 61 / 255, alpha: 1.0)
           let overcastBlueColor: UIColor = UIColor(red: 0, green: 187 / 255, blue: 204 / 255, alpha: 1.0)
        
        override func viewDidLoad() {
            super.viewDidLoad()
           textFields = [txtlogin]
           for textField in textFields {
               textField.delegate = self
           }
           
            
            

//            self.gmailView.roundView()
//            self.twitterView.roundView()
            
    //        fbView.viewconfig(radius: 5)
    //        gmailView.viewconfig(radius: 5)
    //        twitterView.viewconfig(radius: 5)
              btnlogin.roundbuttonRadius(borderwidth: 0)
//
//            emailView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//            passwordView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
            //lgog.image = UIImage.init(named: "Logo")
            //headerView.roundCorners([.bottomLeft,.bottomRight], radius: 200)
        }
        
        
    
    @IBAction func passshowhidAction(_ sender: UIButton) {
           if(passClick == true) {
               txtpassword.isSecureTextEntry = false
               btnpass.setBackgroundImage(UIImage.init(named: "showpass"), for: .normal)
           } else {
               txtpassword.isSecureTextEntry = true
               btnpass.setBackgroundImage(UIImage.init(named: "hidePass"), for: .normal)
           }

           passClick = !passClick
       }
        

        @IBAction func loginAction(_ sender: UIButton) {
            
         if checkData() {
             LoginVendor()
            }
                  
           
        }
        
        
        
        func checkData()-> Bool {
            if txtlogin.text == "" {
               Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Email", messagetype: 0)
                return false
            } else if txtpassword.text == "" {
              Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Password", messagetype: 0)
                return false
            }else if txtpassword.text!.count < 3 || txtpassword.text!.count > 15  {
              Zalert.ZshareAlert.showAlert(title: "Alert", message: " Password length must be 3-15 characters", messagetype: 0)
                return false
            }else if txtlogin.text!.isValidEmail != true  {
              Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Valid Email", messagetype: 0)
                return false
            }
            return true
            
        }
        
    //
        func LoginVendor() {
    
               let dic : [String:Any] = ["email" : txtlogin.text!,"password":txtpassword.text!]
            ShareData.showProgress()
               userhandler.login(parms: dic, Success: {response in
                 ShareData.hideProgress()
                   ShareData.hideProgress()
                   if response.success == 1{
                    ShareData.shareInfo.userInfo = response
                    ShareData.shareInfo.email = self.txtlogin.text!
                    ShareData.shareInfo.password = self.txtpassword.text!
                    ShareData.shareInfo.autologin =  true
                   
                   // if response.vendors?.status == 0 {
                        //self.moveOnBusinessProfile()
                    //}else {
                         self.movetoHome()
                    //}
    
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
    //
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
    //
        
        
        @IBAction func registerAction(_ sender: UIButton) {
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                
            let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
            let vc =  storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
            self.navigationController?.pushViewController(vc!, animated: true)
            
            } else {
            
            let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
            let vc =  storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
            self.navigationController?.pushViewController(vc!, animated: true)
            }
            
        }
        
        
        
        @IBAction func forgotpasswordAction(_ sender: UIButton) {
            
            
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                
            let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
            let vc =  storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
            self.navigationController?.pushViewController(vc!, animated: true)
            
            } else {
            
            let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
            let vc =  storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
            self.navigationController?.pushViewController(vc!, animated: true)
            }
            
        }
        

    @IBAction func GuidAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ZarratSellerGuidVC") as! ZarratSellerGuidVC
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
