//
//  AddSaleVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DropDown
import  SkyFloatingLabelTextField
class AddSaleVC: UIViewController ,UITextFieldDelegate{
var ProductdropDown = DropDown()
    @IBOutlet weak var txtSaleprice: UITextField!
    @IBOutlet weak var txtstartDate: UITextField!
    @IBOutlet weak var txtendDate: UITextField!
    @IBOutlet weak var txtproduct: UITextField!
    @IBOutlet weak var startDateView: UIView!
    @IBOutlet weak var productView: UIView!
    
    @IBOutlet weak var txtactualPrice: UITextField!
    @IBOutlet weak var actualPriceView: UIView!
    @IBOutlet weak var btndropwdown: UIButton!
    
    @IBOutlet weak var btnAddSale: UIButton!
    
    @IBOutlet weak var salePriceView: UIView!
    @IBOutlet weak var discoutView: UIView!
    @IBOutlet weak var endDateView: UIView!
    //@IBOutlet weak var txtdiscount: UITextField!
    
    @IBOutlet weak var txtdiscount: SkyFloatingLabelTextField!
//    @IBOutlet weak var txtmydiscount: UITextField!
    @IBOutlet weak var txtstatus: UITextField!
    @IBOutlet weak var statusView: UIView!
    let startdatePicker = UIDatePicker()
    let edndatePicker = UIDatePicker()
    
    @IBOutlet weak var btnstatus: UIButton!
    var productsList = [Products]()
    
    var checktype: Bool?
    var saleid = 0
    var productid = 0
    var saledropDown = DropDown()
    var status = 0
    var id = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print(saleid)
    print(productid)
        
        
        
        self.txtdiscount.delegate =  self
        self.txtstartDate.delegate = self

        self.txtendDate.delegate = self
         
        addBackButton()
        setUpSale()
        getProductApi()
        
        
        if checktype ==  false {
            self.title = "Edit Sale"
            saleDetailApi()
            self.btnAddSale.setTitle("Edit Sale", for: .normal)
        } else {
            self.title = "Add Sale"
             self.btnAddSale.setTitle("Add Sale", for: .normal)
            
            //self.txtSaleprice.text = "200"
        }
         
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.txtdiscount.delegate =  self
//              self.txtstartDate.delegate = self
//
//              self.txtendDate.delegate = self
    }
    
    
    
    func getProductApi() {
        ShareData.showProgress()
        userhandler.getVendorProducts(Success: {response in
           
             ShareData.hideProgress()
            if  response.success == 1 {
                self.productsList = response.products ?? []
                
               
            } else {
                ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    func saleDetailApi() {
         ShareData.showProgress()
        userhandler.getSingleSale(id: saleid, Success: {response in
             ShareData.hideProgress()
            if response.success == 1 {
                self.txtendDate.text =  formatedDatetype(string: (response.sale?.end_date)!)
                self.id = (response.sale?.onsale_id)!
                self.txtstartDate.text =  formatedDatetype(string: (response.sale?.start_date)!)
                self.txtproduct.text =  response.product?.product_title_en
                self.productid = (response.sale?.product_id)!
                self.txtactualPrice.text =  response.sale?.actual_price
                self.txtdiscount.text = "\(response.sale?.discount_percent ?? 0)"
                self.txtSaleprice.text =  response.sale?.sale_price
                
               
                if  response.sale?.status == 1 {
                    self.txtstatus.text = "Active"
                    self.status =  1
                } else {
                    self.txtstatus.text = "In Active"
                    self.status =  1
                }
            } else {
                ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
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

    
    
    func setdateofEnd(date : Date){
    
    
    
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd" //HH:mm
    let stringDate = dateFormatter.string(from: date)
    self.txtendDate.text = stringDate
    }
    
    
    func setdateofStart(date : Date){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //HH:mm
        let stringDate = dateFormatter.string(from: date)
        self.txtstartDate.text = stringDate


        
    }


    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
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
        } else if textField ==  txtdiscount{
            txtdiscount.delegate = self
            print("i am ok")
            //txtdiscount.becomeFirstResponder()
            //txtdiscount.addTarget(self, action: #selector(myvalue), for: UIControl.Event.valueChanged)
        }
         return true
    }

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        if textField == txtdiscount {
        let value  =  Float(self.txtactualPrice.text!)

            let disco = Float(txtdiscount.text!)
            let calculate =  disco! / 100
            let cal = value! * calculate
            let exactVal = value! - cal

        print(" i am here :",exactVal, "" , cal," ", value)
        self.txtSaleprice.text = "\(exactVal)"
        }
    }
    
       

    func setUpSale(){
        btnAddSale.roundButton()
    
    // productView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
   // startDateView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
       // endDateView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        //discoutView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
       // salePriceView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
       // actualPriceView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        //statusView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
    }

    @IBAction func statusAction(_ sender: UIButton) {
        
        saledropDown.anchorView = btnstatus
                                  saledropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                                  saledropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


                                var statustArray = [String]()
                          statustArray = ["Active","In Active"]
                          saledropDown.dataSource = statustArray

                                  saledropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                                      print(index)
                                      self.txtstatus.text = item
                                      if item == "Active" {
                                          self.status = 1
                                      } else {
                                          self.status = 0
                                      }
                  //
                                      
                                      
              //                        self.params.params.updateValue(self.categoriesList[index].categories_id!, forKey:"vendor_category_id" )
              //                        self.subgategorapicall(id:self.categoriesList[index].categories_id)

                                  }
              
                                  saledropDown.show()
        
    }
    
    
    
    @IBAction func ProductdropwdownAction(_ sender: UIButton) {
        
        ProductdropDown.anchorView = btndropwdown
                        ProductdropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                        ProductdropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


                     
                var productArray = [String]()
                           productArray = productsList.map({($0.product_title_en ?? "")})
                           ProductdropDown.dataSource = productArray
               

                        ProductdropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                            print(index)
                            self.txtproduct.text = item
                            self.productid = self.productsList[index].products_id!
                            self.txtactualPrice.text = self.productsList[index].selling_price
                        }
                        ProductdropDown.show()
        
        
    }
    
    
    
    
    
    
    
    func checkData() -> Bool {
        if txtSaleprice.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Sale Price", messagetype: 0)
            return false
        } else if txtdiscount.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Discount %", messagetype: 0)
            return false
        } else if txtactualPrice.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Actual Price", messagetype: 0)
            return false
        } else if txtproduct.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Product", messagetype: 0)
            return false
        } else if txtstartDate.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Start Date", messagetype: 0)
            return false
        } else if txtendDate.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Ende Date", messagetype: 0)
            return false
        } else if txtstatus.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Status", messagetype: 0)
            return false
        }
        return true
    }
    func  createSaleApi() {
        let dic : [String:Any] = ["product_id": productid, "actual_price": txtactualPrice.text!, "discount_percent": txtdiscount.text!, "sale_price":txtSaleprice.text!, "start_date":txtstartDate.text!, "end_date":txtendDate.text!, "status":status]
        userhandler.createSale(params: dic, Success: {response in
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
    
    
    
    func  updateSaleApi() {
        
        ShareData.showProgress()
        let dic : [String:Any] = ["sale_id":self.id,"product_id": productid, "actual_price": txtactualPrice.text!, "discount_percent": txtdiscount.text!, "sale_price":txtSaleprice.text!, "start_date":txtstartDate.text!, "end_date":txtendDate.text!, "status":status]
        userhandler.updateSale(params: dic, Success: {response in
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
    
    @IBAction func addSaleAction(_ sender: UIButton) {
        
        
        if checktype ==  true {
            
        if checkData() {
             createSaleApi()
            
            }
            
        } else {
            if checkData() {
                updateSaleApi()
                       
            }
        }
    }
    
    
    
    
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//           if textField.text == "" {
//               if textField == txtstartDate{
//                   pickerChnaged(startdatePicker)
//               } else {
//                   pickerChnaged(edndatePicker)
//               }
//           }
//
//
//    }
    
}

