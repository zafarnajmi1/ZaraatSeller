//
//  RestPasswordVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/27/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class RestPasswordVC: UIViewController {

    @IBOutlet weak var txtreenterPAss: UITextField!
    @IBOutlet weak var txtnewpass: UITextField!
    @IBOutlet weak var txtoldpass: UITextField!
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var ReEnterPassView: UIView!
    @IBOutlet weak var newPassView: UIView!
    @IBOutlet weak var oldView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnChange.roundButton()
        addBackButton()
        self.title = "Change Password"
        setupChange()
    }
    
    func setupChange(){
        oldView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        ReEnterPassView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        newPassView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
    }
  
    @IBAction func changeAction(_ sender: UIButton) {
        if checkData() {
            changePassApi()
        }
    }
    func checkData() -> Bool{
        if txtoldpass.text ==  "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Old Password", messagetype: 0)
            return false
        } else if txtnewpass.text ==  "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter New Password", messagetype: 0)
            return false
        } else if txtreenterPAss.text ==  "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Re Enter  Password", messagetype: 0)
            return false
        }
        return true
        
    }
    
    
    func changePassApi(){
        ShareData.showProgress()
        let dic : [String:Any] = ["old_password":txtoldpass.text!,"password":txtnewpass.text!, "password_confirmation":txtreenterPAss.text!]
        userhandler.changePassword(params: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.navigationController?.popViewController(animated: true)
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
}
