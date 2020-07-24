//
//  AddCouponVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DropDown
class AddCouponVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var toitleView: UIView!
    @IBOutlet weak var codeView: UIView!
    
    @IBOutlet weak var couponStatusVidew: UIView!
    @IBOutlet weak var valueTypeView: UIView!
    
    @IBOutlet weak var valueView: UIView!
    
    @IBOutlet weak var endDateView: UIView!
    @IBOutlet weak var startDateView: UIView!
    
    @IBOutlet weak var btncoupon: UIButton!
    
    @IBOutlet weak var txtstatus: UITextField!
    
    
    @IBOutlet weak var btnstatus: UIButton!
    
    @IBOutlet weak var txtendDate: UITextField!
    
    
    @IBOutlet weak var txtstartDate: UITextField!
    
    @IBOutlet weak var txtvalueType: UITextField!
    
    @IBOutlet weak var txtValue: UITextField!
    
    @IBOutlet weak var txttitle: UITextField!
    
    @IBOutlet weak var txtcode: UITextField!
    
    @IBOutlet weak var btndelete: UIButton!
    
    var couponropDown = DropDown()
    var status = 0
    var checktype : Bool?
    var couponid = 0
    let startdatePicker = UIDatePicker()
    let edndatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        addBackButton()
        setUpCoupon()
        self.txtendDate.delegate =  self
        self.txtstartDate.delegate =  self
        
        
        
            if checktype ==  false {
               self.title = "Edit Coupon"
                self.setCouponValue()
                btncoupon.setTitle("Edit Coupon", for: .normal)
                btndelete.isHidden =  false
            }else {
               self.title = "Add Coupon"
                 btndelete.isHidden =  true
            }
    }
    

    
    func setUpCoupon(){
        btncoupon.roundButton()
        btndelete.roundButton()
     toitleView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
    codeView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        couponStatusVidew.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        valueView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        valueTypeView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        startDateView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        endDateView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
        
    }
    
    
    
    func setCouponValue(){
        ShareData.showProgress()
        userhandler.getSingleCoupon(id: couponid, Success: {response in
              ShareData.hideProgress()
            if response.success == 1 {
                self.txtcode.text =  response.coupon?.coupon_code
                 self.txttitle.text =  response.coupon?.coupon_tittle
                 self.txtValue.text =  response.coupon?.coupon_value
              
                if response.status == 1 {
                    self.txtstatus.text =  "Active"
                    self.status = 1
                } else {
                    self.txtstatus.text =  "In Active"
                    self.status = 0
                }
                 
                 self.txtendDate.text =  response.coupon?.end_date
                 self.txtstartDate.text =  response.coupon?.start_date
                 self.txtvalueType.text =  response.coupon?.coupon_value_type
                
            } else {
                ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
        
    }
    
    
    
    @IBAction func deleteAction(_ sender: UIButton) {
        deleteCouponApi()
    }
    
    
    
    func deleteCouponApi() {
        ShareData.showProgress()
        let dic : [String:Any] = ["coupon_id": self.couponid]
        userhandler.deleteCoupon(params: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                self.navigationController?.popViewController(animated: true)
            } else{
                ShareData.hideProgress()
                 Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
             Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    

    @IBAction func statusAction(_ sender: UIButton) {
        
        couponropDown.anchorView = btnstatus
                            couponropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                            couponropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


                          var coupontArray = [String]()
                    coupontArray = ["Active","In Active"]
                   couponropDown.dataSource = coupontArray

                            couponropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                                print(index)
                                self.txtstatus.text = item
                                if item == "Active" {
                                    self.status = 1
                                } else {
                                    self.status = 0
                                }
          
                            }
        
                            couponropDown.show()
    }
    
    
    
    
    
    
    @objc func pickerChnaged1(_ picker : UIDatePicker){
            if picker == edndatePicker {
                 print("Date :\(picker.date)")
                 setdateofEnd(date: edndatePicker.date)
             }
         }
         
         @objc func pickerChnaged(_ picker : UIDatePicker){
             if picker == startdatePicker {
                 print("Date :\(picker.date)")
                 setdateofStart(date: startdatePicker.date)
             }
         }
      
      
      
      func textFieldDidBeginEditing(_ textField: UITextField) {
             if textField == self.txtstartDate {
                 let datePicker = startdatePicker
                 textField.inputView = datePicker
              datePicker.datePickerMode = .date
               datePicker.minimumDate = Date()
                datePicker.addTarget(self, action: #selector(pickerChnaged(_:)), for: UIControl.Event.valueChanged)
             } else if textField == self.txtendDate  {
                 let datePicker = edndatePicker
                 textField.inputView = datePicker
               datePicker.datePickerMode = .date
                 datePicker.minimumDate = Date()
                 datePicker.addTarget(self, action: #selector(pickerChnaged1(_:)), for: UIControl.Event.valueChanged)
             }
         }
      
      
         func setdateofStart(date : Date){
              
              
              let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "yyyy-MM-dd" //HH:mm
              let stringDate = dateFormatter.string(from: date)
              self.txtstartDate.text = stringDate

      
              
          }
      
      
      func setdateofEnd(date : Date){
      
              let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "yyyy-MM-dd" //HH:mm
              let stringDate = dateFormatter.string(from: date)
              self.txtendDate.text = stringDate
      }
    
    
    func cehckDate() -> Bool {
        
        if txttitle.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Coupon Title", messagetype: 0)
            return false
        } else if txtcode.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Coupon Code", messagetype: 0)
            return false
        } else if txtValue.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Coupon Value", messagetype: 0)
            return false
        } else if txtvalueType.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Coupon Value Type ( E.g Rent) ", messagetype: 0)
            return false
        } else if txtstartDate.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Coupon Start Date", messagetype: 0)
            return false
        } else if txtendDate.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Coupon End Date", messagetype: 0)
            return false
        }
        return true
    }
    
    
    
    
    
    
    @IBAction func addCouponAction(_ sender: UIButton) {
        if checktype == true {
        
            if cehckDate() {
                
                createCouponApi()
            }
            
        } else {
            
            if cehckDate() {
                
              updateCouponApi()
            }
        }
    }
    
    
    func createCouponApi() {
        
        let dic : [String:Any] = ["coupon_title":  txttitle.text!, "coupon_code":txtcode.text!, "coupon_value":txtValue.text!, "coupon_value_type":txtvalueType.text!, "start_date":txtstartDate.text!, "end_date":txtendDate.text!, "status": status]
        ShareData.showProgress()
        userhandler.createCoupon(params: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                self.navigationController?.popViewController(animated: true)
                
            } else {
                ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
            
        })
    }
    
    
    
    func updateCouponApi() {
        
        let dic : [String:Any] = ["coupon_title":  txttitle.text!, "coupon_code":txtcode.text!, "coupon_value":txtValue.text!, "coupon_value_type":txtvalueType.text!, "start_date":txtstartDate.text!, "end_date":txtendDate.text!, "status": status,"coupon_id":self.couponid]
        ShareData.showProgress()
        userhandler.updateCoupon(params: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
               self.navigationController?.popViewController(animated: true)
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
