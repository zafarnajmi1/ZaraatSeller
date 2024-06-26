//
//  BillingInfoVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/19/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DropDown
import  GooglePlaces
import  GooglePlacePicker
class BillingInfoVC: UIViewController {
    @IBOutlet weak var billingView: UIView!
    @IBOutlet weak var bankView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var businessInfoView: UIView!
    
    @IBOutlet weak var btnsubmit: UIButton!
    
    @IBOutlet weak var billingPersonView: UIView!
    
    @IBOutlet weak var billingAddressView: UIView!
    
    //@IBOutlet weak var billingZipCodeView: UIView!
    
   // @IBOutlet weak var billingCountryView: UIView!
    
    //@IBOutlet weak var billingstateView: UIView!
    
    @IBOutlet weak var checkboximg: UIImageView!
    
    
    @IBOutlet weak var shippingPersonView: UIView!
    
    
    @IBOutlet weak var shippingAddressView: UIView!
    
    //@IBOutlet weak var shippingAddressZipcodeView: UIView!
    
   // @IBOutlet weak var shippingCountry: UIView!
    
   // @IBOutlet weak var shippingstateView: UIView!
    
    
   // @IBOutlet weak var ViewshippingCity: UIView!
    
    //@IBOutlet weak var txtshippingCity: UITextField!
    
    
    //@IBOutlet weak var viewbilling: UIView!
    
   // @IBOutlet weak var txtbillingCityy: UITextField!
    
    
    
    var params = PostParams()
    
    var addresstype : Bool =  false
   // @IBOutlet weak var txtblinCity: UITextField!
    
   // @IBOutlet weak var txtbilingCountry: UITextField!
    @IBOutlet weak var txtbilingpersonname: UITextField!
    
    
    @IBOutlet weak var txtbilingAddress: UITextField!
    
    //@IBOutlet weak var txtbillingZipcode: UITextField!
    
    
    
    
    @IBOutlet weak var txtshippingpersonname: UITextField!
    
    @IBOutlet weak var txtshippingaddress: UITextField!
    
    
    //@IBOutlet weak var txtshippingZip: UITextField!
    
   // @IBOutlet weak var txtshippingcountry: UITextField!
    
    //@IBOutlet weak var btncountry: UIButton!
    
   // @IBOutlet weak var btncity: UIButton!
    
   // @IBOutlet weak var btnstate: UIButton!
   // @IBOutlet weak var txtshippingcity: UITextField!
    
  //  @IBOutlet weak var btnbilingcity: UIButton!
    
   // @IBOutlet weak var btnblingcountry: UIButton!
    
   // @IBOutlet weak var btnbilingsate: UIButton!
    
    var  editvendorsBProfile : EditBusinessProfileVendors?
     var fromMyaccount = false
    var countrieslist = [Countries]()
    var statelist = [StatesStates]()
    var citieslist = [Cities]()
    var cityDropdown = DropDown()
    var stateDropdown = DropDown()
    var countryDropdown = DropDown()
    
    var checkaddress : Bool? = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Business Profile"
        self.txtshippingaddress.delegate =  self
        self.txtbilingAddress.delegate =  self
         btnsubmit.roundButton()
         addBackButton()
        setUpView()
       // countiresApi()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if fromMyaccount ==  true {
            addBackButton()
            self.navigationController?.navigationBar.isHidden =  false 
            setUpEditProfile()
        }
    }
    
    
    func setUpEditProfile(){
    
        txtbilingAddress.text =  editvendorsBProfile?.billing_address
        
        txtbilingpersonname.text =  editvendorsBProfile?.billing_person_name
        //txtbillingZipcode.text = editvendorsBProfile?.billing_zipcode
        
        
        txtshippingaddress.text =  editvendorsBProfile?.shipping_address
        //txtshippingZip.text =  editvendorsBProfile?.shipping_zipcode
        txtshippingpersonname.text = editvendorsBProfile?.shipping_person_name
        
        
        self.params.params.updateValue(editvendorsBProfile?.billing_longitude ?? "", forKey: "billing_longitude")
        self.params.params.updateValue(editvendorsBProfile?.billing_latitude ?? "", forKey: "billing_latitude")
        
        
        self.params.params.updateValue(editvendorsBProfile?.shipping_longitude ?? "", forKey: "shipping_longitude")
        self.params.params.updateValue(editvendorsBProfile?.shipping_latitude ?? "", forKey: "shipping_latitude")
        
    }
    
    func setUpView(){
//        billingView.viewconfig(radius: 5)
//        bankView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.1410522163, green: 0.3398962617, blue: 0.1778770983, alpha: 1), borderwidth: 1)
//        businessInfoView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.1410522163, green: 0.3398962617, blue: 0.1778770983, alpha: 1), borderwidth: 1)
        
        
//
//        shippingPersonView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//
//
//        shippingAddressView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//
//         shippingAddressZipcodeView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
        // shippingCountry.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
        // shippingstateView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
       
        
        
        
//        billingPersonView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//        
//         billingAddressView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//        
//         billingZipCodeView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
         //billingCountryView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
        // billingstateView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
        //viewbilling.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
       // ViewshippingCity.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
    }
    
    
//    func countiresApi() {
//        userhandler.getCountries(Success: {response in
//            if response.success == 1 {
//                self.countrieslist = response.countries ?? []
//            } else {
//                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
//            }
//        }, Failure: {error in
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
//        })
//    }
    
   // @IBAction func billingCountryAction(_ sender: UIButton) {
       // countryDropdown.anchorView = btnblingcountry
             //   countryDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
             //   countryDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
           // var contryArray = [String]()
        //contryArray = countrieslist.map({$0.name!})
              
       // countryDropdown.dataSource = contryArray
                
               // countryDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
                    //print(index)
                   // self.txtbilingCountry.text = item
                    //self.txtbillingCityy.text = ""
                   // self.txtblinCity.text = ""
                    //self.stateapi(id: self.countrieslist[index].id ?? 0)
                   // self.params.params.updateValue(self.countrieslist[index].id!, forKey: "billing_country")
                //}
                //countryDropdown.show()
    //}
    
    
    
    
   // func stateapi(id: Int?) {
       // userhandler.getState(id: id!, Success: {response in
           // if response.success == 1 {
             //   self.statelist =  response.states ?? []
           // }else {
          //      Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
          //  }
        //}, Failure: {error in
         //   Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
       // })
   // }
    
    
    
    
    
    //@IBAction func billingStateAction(_ sender: UIButton) {
        
       // stateDropdown.anchorView = btnbilingsate
              //  stateDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
               // stateDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            //var stateArray = [String]()
        //stateArray = statelist.map({$0.name!})
              
        //stateDropdown.dataSource = stateArray
                
                //stateDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
                   // print(index)
                    //self.txtblinCity.text = item
                    // self.txtbillingCityy.text = ""
                   // self.cetiesApi(id: self.statelist[index].id ?? 0 )
                    //self.params.params.updateValue(self.statelist[index].id!, forKey: "billing_state")
              //  }
               // stateDropdown.show()
   // }
    
    
    
   // func cetiesApi(id: Int? ) {
     //   userhandler.getCities(id: id, Success: {response in
          //  if response.success == 1 {
             //   self.citieslist = response.cities ?? []
            //}else {
             //   Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
           // }
        //}, Failure: {error in
          //   Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        //})
    //}
    
    
    
    
    
    
    
    
    
//    @IBAction func billingCityAction(_ sender: UIButton) {
//
//
//        cityDropdown.anchorView = btnbilingcity
//                cityDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                cityDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//
//              var cityArray = [String]()
//              cityArray = citieslist.map({$0.name!})
//        cityDropdown.dataSource = cityArray
//
//                cityDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
//                    print(index)
//                    self.txtbillingCityy.text = item
//
//                    self.params.params.updateValue(self.citieslist[index].id!, forKey:"billing_city")
//                }
//                cityDropdown.show()
//    }
//
    
    
    
    
    
    @IBAction func cehckBoxAction(_ sender: UIButton) {
        
        if checkaddress ==  true  {
            checkaddress =  false
            checkboximg.image = UIImage.init(named: "tick")
            
//            btncity.isUserInteractionEnabled = false
//            btnstate.isUserInteractionEnabled = false
//            btncountry.isUserInteractionEnabled = false
            
            //self.txtshippingcity.text = txtblinCity.text
            self.txtshippingaddress.text = txtbilingAddress.text
            //self.txtshippingcountry.text = txtbilingCountry.text
            //self.txtshippingZip.text = txtbillingZipcode.text
            self.txtshippingpersonname.text = txtbilingpersonname.text
            
        } else {
            
           checkboximg.image = UIImage.init(named: "Tickfilled")
            checkaddress =  true 
//            btncity.isUserInteractionEnabled = true
//            btnstate.isUserInteractionEnabled = true
//            btncountry.isUserInteractionEnabled = true
            
           // self.txtshippingcity.text = ""
            self.txtshippingaddress.text = ""
           // self.txtshippingcountry.text = ""
            //self.txtshippingZip.text = ""
            self.txtshippingpersonname.text = ""
        }
        
    }
    
    
//    @IBAction func shippingCoutryAction(_ sender: Any) {
//
//        countryDropdown.anchorView = btncountry
//                countryDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                countryDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//            var contryArray = [String]()
//        contryArray = countrieslist.map({$0.name!})
//
//        countryDropdown.dataSource = contryArray
//
//                countryDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
//                    print(index)
//                    self.txtshippingcountry.text = item
//                    self.txtshippingCity.text = ""
//                    self.txtshippingcity.text = ""
//                    self.stateapi(id: self.countrieslist[index].id!)
//                    self.params.params.updateValue(self.countrieslist[index].id!, forKey: "shipping_country")
//                }
//                countryDropdown.show()
//
//    }
//
//
//    @IBAction func shippingSateAction(_ sender: Any) {
//
//        stateDropdown.anchorView = btnstate
//                       stateDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                       stateDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//                   var stateArray = [String]()
//               stateArray = statelist.map({$0.name!})
//
//               stateDropdown.dataSource = stateArray
//
//                       stateDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
//                           print(index)
//                           self.txtshippingcity.text = item
//
//                        self.txtshippingcity.text = ""
//                           self.cetiesApi(id: self.statelist[index].id! )
//                           self.params.params.updateValue(self.statelist[index].id!, forKey: "shipping_state")
//                       }
//                       stateDropdown.show()
//    }
//
//
//    @IBAction func shippingCityaction(_ sender: UIButton) {
//        cityDropdown.anchorView = btncity
//                cityDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                cityDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//
//              var cityArray = [String]()
//              cityArray = citieslist.map({$0.name!})
//        cityDropdown.dataSource = cityArray
//
//                cityDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
//                    print(index)
//                    self.txtshippingCity.text = item
//
//                    self.params.params.updateValue(self.citieslist[index].id!, forKey:"shipping_city")
//                }
//                cityDropdown.show()
//    }
//
//
//
    
    
    
    
    @IBAction func submitAction(_ sender: UIButton) {
        
        if checkData() {
            params.params.updateValue(ShareData.shareInfo.userInfo?.vendors?.vendor_id ?? "", forKey: "vendor_id")
            params.params.updateValue(txtbilingpersonname.text!, forKey: "billing_person_name")
            params.params.updateValue(txtbilingAddress.text!, forKey: "billing_address")
            //params.params.updateValue(txtbillingZipcode.text!, forKey: "billing_zipcode")
            
            params.params.updateValue(txtshippingpersonname.text!, forKey: "shipping_person_name")
            params.params.updateValue(txtshippingaddress.text!, forKey: "shipping_address")
            //params.params.updateValue(txtshippingZip.text!, forKey: "shipping_zipcode")
            
            params.params.updateValue("1", forKey: "shipping_status")
            params.params.updateValue("1", forKey: "billing_status")
            
            params.params.updateValue(params.features, forKey:"vendor_category_id")
            
        
            print(params.params)
            ShareData.showProgress()
            userhandler.businessProfile(parms: params.params, Success: {response in
                ShareData.hideProgress()
                if response.success == 1 {
                     Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                    self.LoginVendor()
                        self.movetoHome()
                    
                } else {
                    ShareData.hideProgress()
                    Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
                }
                
            }, Failure: {error in
                ShareData.hideProgress()
                 Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
            })
            
        }
    }
    
    
    
    
    
//    ["business_registration_num": "12345678-9", "shipping_longitude": "74.3587", "vendor_branch_code": "1234", "billing_person_name": "ended", "vendor_account_number": "12345678", "vendor_category_id": [29], "business_document": "https://zaraatbin.s3.us-east-2.amazonaws.com/images/vendors/documents/1597215318.", "company_name": "test", "business_status": "1", "market": "ecommerce", "vendor_account_title": "QWERTY", "legal_name": "zaraat", "shipping_latitude": "31.5204", "business_phone": "1234567", "bank_status": "1", "vendor_latitude": "31.5203696", "billing_longitude": "74.3587", "billing_address": "Lahore, Punjab, Pakistan", "question": 1, "billing_status": "1", "description_urdu": "Asdfghj", "logo": "", "vendor_id": 174, "shipping_person_name": "weigh", "bank_id": 10, "bussiness_email": "testonetwo@gmail.com", "vendor_type": "Supplier", "shipping_address": "Lahore, Punjab, Pakistan", "description": "Asdfgh", "business_type": "Business", "status": "1", "address": "Lahore, Punjab, Pakistan", "shipping_status": "1", "answer": "asdfg", "package": "1", "billing_latitude": "31.5204", "vendor_longitude": "74.3587473"]
    
    
    
    
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
    
    
    func checkData() ->Bool {
         if txtbilingAddress.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing Address ", messagetype: 0)
            return false
        }
//         else if txtbillingZipcode.text == "" {
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing Zip Code ", messagetype: 0)
//            return false
//        }
         else if txtbilingpersonname.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing Person Name ", messagetype: 0)
            return false
        }
        else if txtshippingaddress.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Shipping Address ", messagetype: 0)
            return false
        }
//         else if txtshippingZip.text == "" {
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Shipping Zip Code ", messagetype: 0)
//            return false
//        }
         else if txtshippingpersonname.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Shipping Person Name ", messagetype: 0)
            return false
        }
        return true
    }
    
    
    
    @IBAction func skipAction(_ sender: UIButton) {
        params.params.updateValue(ShareData.shareInfo.userInfo?.vendors?.vendor_id ?? "", forKey: "vendor_id")
        params.params.updateValue(txtbilingpersonname.text!, forKey: "billing_person_name")
        params.params.updateValue(txtbilingAddress.text!, forKey: "billing_address")
        //params.params.updateValue(txtbillingZipcode.text!, forKey: "billing_zipcode")
        
        params.params.updateValue(txtshippingpersonname.text!, forKey: "shipping_person_name")
        params.params.updateValue(txtshippingaddress.text!, forKey: "shipping_address")
       // params.params.updateValue(txtshippingZip.text!, forKey: "shipping_zipcode")
        
        params.params.updateValue("1", forKey: "shipping_status")
        params.params.updateValue("1", forKey: "billing_status")
        
        params.params.updateValue(params.features, forKey:"vendor_category_id")
        businessPrfileSkipAction()
        
    }
    
//    ["bank_id": 10, "address": "Lahore, Punjab, Pakistan", "shipping_latitude": "31.5204", "billing_address": "Lahore, Punjab, Pakistan", "shipping_person_name": "weigh", "bussiness_email": "testonetwo@gmail.com", "shipping_address": "Lahore, Punjab, Pakistan", "company_name": "test", "description_urdu": "Asdfghj", "logo": "https://zaraatbin.s3.us-east-2.amazonaws.com/images/vendors/documents/1597215318.", "business_status": "1", "description": "Asdfgh", "question": 1, "legal_name": "zaraat", "vendor_id": 174, "vendor_longitude": "74.3587473", "market": "ecommerce", "billing_latitude": "31.5204", "billing_status": "1", "answer": "asdfg", "status": "1", "vendor_category_id": [29], "vendor_latitude": "31.5203696", "billing_longitude": "74.3587", "shipping_longitude": "74.3587", "billing_person_name": "ended", "business_registration_num": "12345678-9", "shipping_status": "1", "package": "1", "vendor_type": "Supplier", "business_document": "", "business_phone": "1234567", "bank_status": "1", "business_type": "Business"]
    
    
    
    
    
    
    func businessPrfileSkipAction(){
         params.params.updateValue(ShareData.shareInfo.userInfo?.vendors?.vendor_id ?? "", forKey: "vendor_id")
         params.params.updateValue(params.features, forKey:"vendor_category_id")
        print(params.params)
                   ShareData.showProgress()
                   userhandler.businessProfile(parms: params.params, Success: {response in
                       ShareData.hideProgress()
                       if response.success == 1 {
                            Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                        self.LoginVendor()
                          self.movetoHome()
                        
                       } else {
                           ShareData.hideProgress()
                           Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
                       }
                       
                   }, Failure: {error in
                       ShareData.hideProgress()
                        Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
                   })
    }
    
    
    
    
        func LoginVendor() {
    
                  let dic : [String:Any] = ["email" : ShareData.shareInfo.email ?? "","password":ShareData.shareInfo.password ?? ""]
               ShareData.showProgress()
                  userhandler.login(parms: dic, Success: {response in
                    ShareData.hideProgress()
                      ShareData.hideProgress()
                      if response.success == 1{
                       ShareData.shareInfo.userInfo = response
    
                      // if response.vendors?.status == 0 {
                           //self.moveOnBusinessProfile()
                      // }else {
                           // self.movetoHome()
                       //}
    
                          //Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                      }else {
                        ShareData.hideProgress()
                          
                          //Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
                        //self.moveOnLogin()
                      }
    
                  }, Failure: {error in
                      ShareData.hideProgress()
                      //Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
                  })
              }
}
//MARK:- AutoCompleteAddress
extension BillingInfoVC: UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.txtbilingAddress {
            self.addresstype =  false
            let autoComplete = GMSAutocompleteViewController()
            autoComplete.delegate = self
//            UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1026112512, green: 0.6214135885, blue: 0.06590007991, alpha: 1)
//            UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.1026112512, green: 0.6214135885, blue: 0.06590007991, alpha: 1)
            present(autoComplete, animated: true, completion: nil)
        } else if textField == self.txtshippingaddress {
                  self.addresstype =   true
                    let autoComplete = GMSAutocompleteViewController()
                    autoComplete.delegate = self
        //            UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1026112512, green: 0.6214135885, blue: 0.06590007991, alpha: 1)
        //            UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.1026112512, green: 0.6214135885, blue: 0.06590007991, alpha: 1)
                    present(autoComplete, animated: true, completion: nil)
                }

        let placePickerController = GMSAutocompleteViewController()
        placePickerController.delegate = self
        self.present(placePickerController, animated: true) {
        }
//        let config = GMSPlacePickerConfig(viewport: nil)
//        let placePicker = GMSPlacePickerViewController(config: config)
//        placePicker.delegate = self
//        present(placePicker, animated: true, completion: nil)
    }
}
///GMSAutocompleteViewControllerDelegate
extension BillingInfoVC: GMSAutocompleteViewControllerDelegate {
    


    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {

        if  self.addresstype ==  false {
        
        self.params.params.updateValue(place.coordinate.longitude, forKey: "billing_longitude")
        self.params.params.updateValue(place.coordinate.latitude, forKey: "billing_latitude")

            self.txtbilingAddress?.text = place.formattedAddress!
        } else {
                    self.params.params.updateValue(place.coordinate.longitude, forKey: "shipping_longitude")
                    self.params.params.updateValue(place.coordinate.latitude, forKey: "shipping_latitude")

                    self.txtshippingaddress?.text = place.formattedAddress!
        }

        dismiss(animated: true, completion: nil)

    }

    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {

        viewController.dismiss(animated: true, completion: nil)

        print("No place selected")
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {

        print("Error: ", error.localizedDescription)
    }

    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion:nil )
    }


    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }


    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didSelect prediction: GMSAutocompletePrediction) -> Bool {
        dismiss(animated: true, completion: nil)
        return true
    }


}
