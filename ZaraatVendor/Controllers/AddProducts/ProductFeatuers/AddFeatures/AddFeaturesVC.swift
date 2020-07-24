//
//  AddFeaturesVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import DropDown
class AddFeaturesVC: UIViewController {

    
    @IBOutlet weak var txtdescEn: UITextView!
    @IBOutlet weak var descriptionEnView: UIView!
    @IBOutlet weak var titleViewurdu: UIView!
    
    @IBOutlet weak var titlViewEn: UIView!
    
    @IBOutlet weak var descriptionViewurdu: UIView!
    
    @IBOutlet weak var txtstatus: UITextField!
    
    @IBOutlet weak var btnFeature: UIButton!
    
    @IBOutlet weak var txttitleEn: UITextField!
    
    @IBOutlet weak var txttitleurdu: UITextField!
    
   @IBOutlet weak var btnstatus: UIButton!
     var featuresdropDown = DropDown()
    @IBOutlet weak var featuresStatusView: UIView!
    @IBOutlet weak var txtdescriptionUrdu: UITextView!
    var status = 0
    var productid = 0
   
    var features : Features?
    var checktype : Bool? = false 
    override func viewDidLoad() {
        super.viewDidLoad()
        
      addBackButton()
        setUpFeature()
        
       
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if checktype == true {
                   self.title = "Add Feature"
               } else {
                   self.title = "Edit Feature"
                   btnFeature.setTitle("Edit Features", for: .normal)
            
            txtdescriptionUrdu.text =  features?.feature_desc_urdu
            txtdescEn.text =  features?.feature_desc_en
            status =  (features?.feature_status)!
            if status == 1 {
                txtstatus.text = "Active"
            } else {
                txtstatus.text = "In Active"
            }
            txttitleEn.text =  features?.feature_title_en
            txttitleurdu.text =  features?.feature_title_urdu
            self.productid =  (features?.product_id)!
        }
        
    }

    func setUpFeature(){
        btnFeature.roundButton()
    descriptionEnView.layer.cornerRadius = 10
    descriptionEnView.layer.borderWidth = 1
    descriptionEnView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
        featuresStatusView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
    descriptionViewurdu.layer.cornerRadius = 10
    descriptionViewurdu.layer.borderWidth = 1
    descriptionViewurdu.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
        
    txtdescEn.delegate = self
     txtdescEn.textColor = UIColor.lightGray
     txtdescEn.text = "Description(En)"
    txtdescEn.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
    
    
    
    txtdescriptionUrdu.delegate = self
     txtdescriptionUrdu.textColor = UIColor.lightGray
     txtdescriptionUrdu.text = "Description(urdu)"
    txtdescriptionUrdu.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
    
    
    
     titlViewEn.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
    titleViewurdu.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
    }
    
    
    @IBAction func featuresaction(_ sender: UIButton) {
        
         featuresdropDown.anchorView = btnstatus
                            featuresdropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                            featuresdropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


                          var statustArray = [String]()
                    statustArray = ["Active","In Active"]
                    featuresdropDown.dataSource = statustArray

                            featuresdropDown.selectionAction = { [unowned self] (index: Int, item: String) in
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
        
                            featuresdropDown.show()
    }
    
    
    
    
    func checkData() -> Bool {
        
        
        if txttitleEn.text! == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Title(en)", messagetype: 0)
            return false
        } else if txttitleurdu.text! == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Title(urdu)", messagetype: 0)
            return false
        } else if txtdescEn.text! == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Description(en)", messagetype: 0)
            return false
        } else if txttitleurdu.text! == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Title(urdu)", messagetype: 0)
            return false
        }
        return true
    }
    
    
    
    @IBAction func addFeaturesAction(_ sender: UIButton) {
        if checkData() {
           createFeatureAcctionApi()
        }
    }
    
    func createFeatureAcctionApi() {
        let dic : [String:Any] = ["product_id":productid, "feature_title_en":txttitleEn.text!, "feature_title_urdu": txttitleurdu.text!, "feature_desc_en":txtdescEn.text!, "feature_desc_urdu":txtdescriptionUrdu.text!, "feature_status": self.status, "feature_id": features?.feature_id ?? 0]
        
        print(dic)
        ShareData.showProgress()
        userhandler.addFeatures(params: dic, Success: {response in
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
extension AddFeaturesVC: UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Description(En)" {
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            
        }
        else if textView.text == "Description(urdu)"{
            
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            
        }
      
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == txtdescEn {
            if textView.text == ""{
            textView.text = "Description(En)"
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            
            }
        }
        else if textView == txtdescriptionUrdu {
            if textView.text == ""{
                textView.text = "Description(urdu)"
                textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
               
            }
        }
        
        
    }
    
    
    
    
    
    
}
