//
//  SignUpVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/27/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DropDown
class SignUpVC: BaseVC {
   var mydropwdown = DropDown()
    @IBOutlet weak var btnsignUp: UIButton!
   
//    @IBOutlet weak var usernameView: UIView!
//    @IBOutlet weak var emailView: UIView!
//    @IBOutlet weak var passwordView: UIView!
//
//    @IBOutlet weak var btnquestion: UIButton!
//    @IBOutlet weak var lastNameView: UIView!
//    @IBOutlet weak var confirmPasswordView: UIView!
//
//    @IBOutlet weak var phoneView: UIView!
//    //@IBOutlet weak var cityView: UIView!
//
//    @IBOutlet weak var txtlastName: UITextField!
    @IBOutlet weak var txtuserName: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtconfirmpassword: UITextField!
    @IBOutlet weak var txtphonenumber: UITextField!
    
    //@IBOutlet weak var txtcity: UITextField!
    
//    @IBOutlet weak var txtanswer: UITextField!
//    @IBOutlet weak var answerView: UIView!
//
//    @IBOutlet weak var questionView: UIView!
//    // @IBOutlet weak var questionView: UIView!
//
//    @IBOutlet weak var txtquestion: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewconfigsignup()
    }
    
    
    
    func viewconfigsignup(){
        btnsignUp.roundbuttonRadius(borderwidth: 0)
//        usernameView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//        emailView.addInnerShadow(topColor: #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1))
//        passwordView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//        confirmPasswordView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//        phoneView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        //cityView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        //lastNameView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        //questionView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
       // questionView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        //answerView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
    }

    @IBAction func signUpAction(_ sender: UIButton) {
        
        if checkData() {
            self.registerVendor()
        }
        
        
    
    }
    @IBAction func loginAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    func checkData() -> Bool {
        if  txtuserName.text == "" {
           Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Full Name", messagetype: 0)
            return false
        } else if  txtemail.text == "" {
           Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Email", messagetype: 0)
            return false
         }
            //else if  txtemail.text?.isValidEmail == false {
//           Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Valid Email", messagetype: 0)
//            return false
//        }
        else if  txtphonenumber.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Phone Number ", messagetype: 0)
            return false
        } else if  txtpassword.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Password", messagetype: 0)
            return false
        } else if  txtconfirmpassword.text == "" {
           Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Confirm Password", messagetype: 0)
            return false
        } else if  txtconfirmpassword.text != txtpassword.text {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Password does not match", messagetype: 0)
            return false
        }
        return true
    }
    
    
    
    func registerVendor() {

        let dic : [String:Any] = ["owners_name": txtuserName.text!,
                                  "phone":txtphonenumber.text!,
                                  "email" : txtemail.text!,
                                  "password":txtpassword.text!]
         ShareData.showProgress()
        userhandler.Register(parms: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                ShareData.shareInfo.userInfo = response
                ShareData.shareInfo.email = self.txtemail.text!
                ShareData.shareInfo.password = self.txtpassword.text!
                ShareData.shareInfo.autologin =  true
                //if response.vendors?.status == 0 || response.vendors?.status == nil  {
                   // self.moveOnBusinessProfile()
                //}else {
                     self.movetoHome()
                //}
            }else {
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
