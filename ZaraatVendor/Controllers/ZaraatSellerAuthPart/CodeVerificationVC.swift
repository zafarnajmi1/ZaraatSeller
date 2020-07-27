//
//  CodeVerificationVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/27/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class CodeVerificationVC: BaseVC, UITextFieldDelegate {
        
        

        @IBOutlet weak var btnNext: UIButton!
        @IBOutlet weak var txtfour: UITextField!
        @IBOutlet weak var fourView: UIView!
        @IBOutlet weak var txtThree: UITextField!
        @IBOutlet weak var threeView: UIView!
        @IBOutlet weak var txtTwo: UITextField!
        @IBOutlet weak var twoView: UIView!
        @IBOutlet weak var oneView: UIView!
        @IBOutlet weak var txtOne: UITextField!
        var id = 0
        var code = ""
        override func viewDidLoad() {
            super.viewDidLoad()
            codeConfig()
        }

        func codeConfig(){
            // 5. set the regular UItextField delegate to each textField
                   txtOne.delegate = self
                   txtTwo.delegate = self
                   txtThree.delegate = self
                   txtfour.delegate = self
            txtOne.textContentType = .oneTimeCode
             txtTwo.textContentType = .oneTimeCode
             txtThree.textContentType = .oneTimeCode
             txtOne.textContentType = .oneTimeCode
                   // 6. set the subClassed textField delegate to each textField
                  
            btnNext.roundbuttonRadius(borderwidth: 2)
            oneView.addInnerShadowForVerificationCode(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
            twoView.addInnerShadowForVerificationCode(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
            threeView.addInnerShadowForVerificationCode(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
            fourView.addInnerShadowForVerificationCode(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        }
        
        
        
        
    //
        func cehckData() -> Bool {
           code = txtOne.text! +  txtTwo.text! + txtThree.text! + txtfour.text!
            if code == "" {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter  The Code", messagetype: 0)
                return false
            }
            return true
        }
    //
    //
        func verifycodeApi(){
            let dic : [String:Any] = ["vendor_id":self.id, "code":code]
            ShareData.showProgress()
            userhandler.codeVeriFy(params: dic, Success: {response in
                 ShareData.hideProgress()
                if response.success == 1 {
                    Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                    self.moveOnResetPassword()
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
        func moveOnResetPassword() {
            if UIDevice.current.userInterfaceIdiom == .pad {
    
                   let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                   let vc =  storyBoard.instantiateViewController(withIdentifier: "ChangePasswordVC") as? ChangePasswordVC
                vc!.id = id
                   self.navigationController?.pushViewController(vc!, animated: true)
    
            } else {
    
                   let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                   let vc =  storyBoard.instantiateViewController(withIdentifier: "ChangePasswordVC") as? ChangePasswordVC
                vc!.id = id
                   self.navigationController?.pushViewController(vc!, animated: true)
                }
        }
    //
    //
    //
    //
    //
        
        
        @IBAction func resendAction(_ sender: UIButton) {
            
            
        }
        
        
        
        @IBAction func NextAction(_ sender: UIButton) {
            
            if cehckData() {
                verifycodeApi()
            }
            

            
        }
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

            if let text = textField.text {

                // 10. when the user enters something in the first textField it will automatically adjust to the next textField and in the process do some disabling and enabling. This will proceed until the last textField
                if (text.count < 1) && (string.count > 0) {

                    if textField == txtOne {
                        //txtcode.isEnabled = false
                        txtTwo.isEnabled = true
                        txtTwo.becomeFirstResponder()
                    }

                    if textField == txtTwo {
                        //txtscnd.isEnabled = false
                        txtThree.isEnabled = true
                        txtThree.becomeFirstResponder()
                    }

                    if textField == txtThree {
                        //txtthird.isEnabled = false
                        txtfour.isEnabled = true
                        txtfour.becomeFirstResponder()
                    }

                    if textField == txtfour {
                        // do nothing or better yet do something now that you have all four digits for the sms code. Once the user lands on this textField then the sms code is complete
                    }

                    textField.text = string
                    return false

                } // 11. if the user gets to the last textField and presses the back button everything above will get reversed
                else if (text.count >= 1) && (string.count == 0) {

                    if textField == txtTwo {
                        //txtscnd.isEnabled = false
                        txtOne.isEnabled = true
                        txtOne.becomeFirstResponder()
                        txtOne.text = ""
                    }

                    if textField == txtThree {
                        //txtthird.isEnabled = false
                        txtTwo.isEnabled = true
                        txtTwo.becomeFirstResponder()
                        txtTwo.text = ""
                    }

                    if textField == txtfour {
                       // txtfourth.isEnabled = false
                        txtThree.isEnabled = true
                        txtThree.becomeFirstResponder()
                        txtThree.text = ""
                    }

                    if textField == txtOne {
                        // do nothing
                    }

                    textField.text = ""
                    return false

                } // 12. after pressing the backButton and moving forward again you will have to do what's in step 10 all over again
                else if text.count >= 1 {

                    if textField == txtOne {
                        //txtcode.isEnabled = false
                        txtTwo.isEnabled = true
                        txtTwo.becomeFirstResponder()
                    }

                    if textField == txtTwo {
                        //txtscnd.isEnabled = false
                        txtThree.isEnabled = true
                        txtThree.becomeFirstResponder()
                    }

                    if textField == txtThree {
                        //txtthird.isEnabled = false
                        txtfour.isEnabled = true
                        txtfour.becomeFirstResponder()
                    }

                    if textField == txtfour {
                        // do nothing or better yet do something now that you have all four digits for the sms code. Once the user lands on this textField then the sms code is complete
                    }

                    textField.text = string
                    return false
                }
            }
            return true
        }
        
    }

