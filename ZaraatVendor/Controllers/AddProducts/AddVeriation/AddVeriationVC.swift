//
//  AddVeriationVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  SwiftyMenu
class AddVeriationVC: UIViewController {
    

    @IBOutlet weak var tblheight: NSLayoutConstraint!
    
    @IBOutlet weak var tblView: UITableView!
    
    
    @IBOutlet weak var titleEnView: UIView!
    
    
    @IBOutlet weak var titleUrduView: UIView!
    
    @IBOutlet weak var priceView: UIView!
    
    
    @IBOutlet weak var stockview: UIView!
    
    @IBOutlet weak var descriptionEnView: UIView!
    
    @IBOutlet weak var descriptionUrduView: UIView!
    
    @IBOutlet weak var btnaddVariation: UIButton!
    
    @IBOutlet weak var txttitleen: UITextField!
    
    @IBOutlet weak var txttitleurdu: UITextField!
    
    @IBOutlet weak var txtprice: UITextField!
    
    @IBOutlet weak var txtstock: UITextField!
    
    @IBOutlet weak var txtdescriptionEn: UITextView!
    
    @IBOutlet weak var txtdescriptionurdu: UITextView!
    
    @IBOutlet weak var attributeView: UIView!
    
    //@IBOutlet weak var txtvendorPrice: UITextField!
   // @IBOutlet weak var vendorPriceView: UIView!
    var productid = 0
    var variationid = 0
    var attributsList =  [Attributs]()
     var attributesEditList =  [Attributes]()
      var attributValueList =  [Attribute_values]()
    var section = 0
    var my2Darr = [[Int]]()
    var testarray = [Int]()
    
    var checktype : Bool? =  false 
    var attrr : [String: [Int]] = [:]// Dictionary<Int, Array<Int>>()
    var vParms = VariationParams()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.addBackButton()
        
        self.tblView.tableFooterView =  UIView(frame: .zero)
        
        tblView?.allowsMultipleSelection = true
    
        self.tblView?.register(UINib.init(nibName: "CategoryHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "CategoryHeader")
         self.tblView.register(UINib.init(nibName: "VariationCell", bundle: nil), forCellReuseIdentifier: "VariationCell")
        
        self.tblView.register(UINib.init(nibName: "ColorCell", bundle: nil), forCellReuseIdentifier: "ColorCell")
         setVariation()
        attributeaApi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if checktype == true {
            self.title = "Add Vartiation"
        } else {
            self.title = "Edit Vartiation"
            btnaddVariation.setTitle("Edit Variation", for: .normal)
             variationDetailApi()
        }
    }
    private func setViewHeight(){
        var tableViewHeight:CGFloat = 0
        for i in 0..<self.tblView.numberOfRows(inSection: 0){
            tableViewHeight = tableViewHeight + tableView(self.tblView, heightForRowAt: IndexPath(row: i, section: 0))
        }
        tblheight.constant = tableViewHeight + 20
        self.tblView.setNeedsDisplay()
    }
    
    
    func setVariation(){
        
        btnaddVariation.roundButton()
         //titleEnView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
          //titleUrduView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
           
         //  priceView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
           
           
          // stockview.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
          
                    attributeView.layer.cornerRadius = 10
                    attributeView.layer.borderWidth = 1
                    attributeView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
            
                    descriptionEnView.layer.cornerRadius = 10
                   descriptionEnView.layer.borderWidth = 1
                   descriptionEnView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
                   
                   descriptionUrduView.layer.cornerRadius = 10
                   descriptionUrduView.layer.borderWidth = 1
                   descriptionUrduView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
            
            
            
        
        txtdescriptionEn.delegate = self
         txtdescriptionEn.textColor = UIColor.lightGray
         txtdescriptionEn.text = "Description(eng)"
        txtdescriptionEn.textColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
        
        
        
        txtdescriptionurdu.delegate = self
         txtdescriptionurdu.textColor = UIColor.lightGray
         txtdescriptionurdu.text = "Description(urdu)"
        txtdescriptionurdu.textColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
        
       
        
    }
    func attributeaApi(){
        userhandler.getAttributes(Success: {response in
            if response.success == 1 {
                self.attributsList =  response.attributs ?? []
                
                self.tblView.reloadData()
               // self.setViewHeight()
            } else {
                
            }
        }, Failure: {error in
            
        })
    }
    
    
    
    
    
    func variationDetailApi(){
        ShareData.showProgress()
        userhandler.getVariationDetail(id: variationid, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.variationid =  (response.variation?.variation_id)!
                self.productid = (response.variation?.product_id)!
                self.txtprice.text =  response.variation?.variation_price
                self.txtstock.text =  response.variation?.variation_stock
                self.txttitleen.text =  response.variation?.variation_title_en
                self.txttitleurdu.text =  response.variation?.variation_title_urdu
                self.txtdescriptionEn.text =  response.variation?.variation_description_en
                self.txtdescriptionurdu.text =  response.variation?.variation_description_urdu
                
                for item in (response.variation?.attributes)! {
                    //if item.isSelected ==  true {
                    for i in item.vals! {

                        self.attrr["\(item.attribute_id ?? 0)",default: [Int]()].append(i.attribute_values_id ?? 0)

                        }
                   // }
                }
                //self.attributsList =  response.variation?.attributes![0].vals
                self.tblView.reloadData()
                
            } else {
                 ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
             ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    
    
    
    
    
    
    func checkData() -> Bool {
        
        if txttitleen.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Title(en)", messagetype: 0)
          return false
        } else if txttitleurdu.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Title(urdu)", messagetype: 0)
          return false
        } else if txtprice.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Price", messagetype: 0)
          return false
        }  else if txtstock.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Stock", messagetype: 0)
          return false
        } else if txtdescriptionEn.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Description(eng)", messagetype: 0)
          return false
        }
        //else if txtdescriptionurdu.text == "" {
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Description(urdu)", messagetype: 0)
//          return false
//        }
        return true
    }
    
    
    @IBAction func addVariationAction(_ sender: UIButton) {
        if checkData() {
            addVariationApi()
        }
        
    }
    
    func addVariationApi() {
        
       
        
        for item in attributsList {
            //if item.isSelected ==  true {
                for i in item.attribute_values! {
                    if i.selected ==  true {
                        attrr["\(item.attribute_id ?? 0)",default: [Int]()].append(i.attribute_values_id ?? 0)
                    }
                }
           // }
        }
        
         let   dic : [String:Any]  =  ["product_id":productid,"variation_id":variationid, "variation_title_en":txttitleen.text!, "variation_title_urdu": txttitleurdu.text!, "variation_description_en": txtdescriptionEn.text!, "variation_description_urdu":txtdescriptionurdu.text!, "variation_price":txtprice.text!,  "variation_stock":txtstock.text!, "attr": self.attrr]
       
        //["1":[1,2], "2":[13,14]]
        
        print(dic)
        ShareData.showProgress()
        userhandler.addVariation(params: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                self.navigationController?.popViewController(animated: true)
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

extension AddVeriationVC:  UITableViewDataSource,UITableViewDelegate,VariationHeaderDelegate {
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {


        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier:"CategoryHeader") as? CategoryHeader {

            let AttributeList = self.attributsList[section]

            headerView.loadHeaderView(object: AttributeList, section: section)
            
            if AttributeList.isSelected ?? false {

                headerView.arrowDown.image = UIImage(named: "dropdown")
            }
            else{
                headerView.arrowDown.image = UIImage(named: "dropdown-1")
            }
            headerView.delegate = self
            return headerView
        }
        else{
            return UIView()
        }

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.attributsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let attribute = self.attributsList[section]
        
        if attribute.isSelected == true  {
            
                return attribute.attribute_values!.count
            
        }
        else{
            return 0
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
   
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if attributsList[indexPath.section].attribute_title == "Color" {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") as? ColorCell  else { return UITableViewCell() }
            let attribute = self.attributsList[indexPath.section]
           
        if let attributeValues = attribute.attribute_values?[indexPath.row] {
                cell.loadCell(object: attributeValues)
         }
            
             if attribute.attribute_values?[indexPath.row].selected ?? false{
                    
                       tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
                     cell.accessoryType = .checkmark
                    } else {
                    
                       tableView.deselectRow(at: indexPath, animated: false)
                    cell.accessoryType = .none
                    }
            
            return cell
    } else {
    
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VariationCell") as? VariationCell  else { return UITableViewCell() }
        let attribute = self.attributsList[indexPath.section]
       
    if let attributeValues = attribute.attribute_values?[indexPath.row] {
            cell.loadCell(object: attributeValues)
     }
        
         if attribute.attribute_values?[indexPath.row].selected ?? false{
                
                   tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
                 cell.accessoryType = .checkmark
                } else {
                
                   tableView.deselectRow(at: indexPath, animated: false)
                cell.accessoryType = .none
                }
        
        return cell
    }
    }
    func toggleSection(header:CategoryHeader, section: Int) {
        let category = self.attributsList[section]
       
        if category.isSelected == true {
            category.isSelected = false
            header.arrowDown.image = UIImage(named: "downarrow")
        }
        else{
           category.isSelected = true
           header.arrowDown.image = UIImage(named: "downarrow-1")
        }
        
        tblView.beginUpdates()
        tblView.reloadSections([section], with: .fade)
        tblView.endUpdates()
        
    }
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let attrilist =  self.attributsList[indexPath.section]
   
    
    
         attrilist.attribute_values![indexPath.row].selected =  true
//    if   attrr["\(attrilist.attribute_id ?? 0)",default: [Int]()].contains(attrilist.attribute_values![indexPath.row].attribute_values_id ?? 0) {
//
//    } else {
//        attrr["\(attrilist.attribute_id ?? 0)",default: [Int]()].append(attrilist.attribute_values![indexPath.row].attribute_values_id ?? 0)
//        print(self.attrr)
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        tblView.reloadData()
//    }
    
    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
           tblView.reloadData()
    
    
    
//var dictionary = [Int:[String]]()
    
     //attrr["\(attrilist.attribute_id ?? 0)"]?.append(attrilist.attribute_values![indexPath.row].attribute_values_id ?? 0)
//  attrr["\(attrilist.attribute_id ?? 0)",default: [Int]()].append(attrilist.attribute_values![indexPath.row].attribute_values_id ?? 0)
//    print(self.attrr)
    //self.attrr["2",de]
//    if self.attrr["\(attrilist.attribute_id ?? 0)"] == nil{
//        self.attrr.removeAll()
//       self.attrr["\(attrilist.attribute_id ?? 0)"]  = [attrilist.attribute_values![indexPath.row].attribute_values_id ?? 0]
//        print(self.attrr)
//    } else {
//     self.attrr["\(attrilist.attribute_id ?? 0)"]?.append(attrilist.attribute_values![indexPath.row].attribute_values_id ?? 0)
//     print(self.attrr)
//     }
    
//    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//    tblView.reloadData()
       
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       let attrilist =  self.attributsList[indexPath.section]
         tableView.cellForRow(at: indexPath)?.accessoryType = .none
         attrilist.attribute_values![indexPath.row].selected =  false
        //print(self.attrr["\(attrilist.attribute_id ?? 0)"]!.count,indexPath.row )

//        if  self.attrr["\(attrilist.attribute_id ?? 0)"]?.isEmpty != nil && self.attrr["\(attrilist.attribute_id ?? 0)"]!.count >= indexPath.row{
//
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//            attrilist.attribute_values![indexPath.row].selected =  false
//
//
//            //self.attrr["\(attrilist.attribute_id ?? 0)"]?.remove(at: indexPath.row   )
//        //self.attrr["\(attrilist.attribute_id ?? 0)", default: []].remove(at: indexPath.row )
//        }
           // print(attrr)
//        tblView.beginUpdates()
//        tblView.endUpdates()
     tblView.reloadData()
    }
    
}
extension AddVeriationVC : UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
           if textView.text == "Description(eng)" {
               textView.text = ""
               textView.textColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
               
           }
           else if textView.text == "Description(urdu)"{
               
               textView.text = ""
               textView.textColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
               
           }
         
           
       }
       
       func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
           if text == "\n" {
               textView.resignFirstResponder()
           }
           return true
       }
       
       func textViewDidEndEditing(_ textView: UITextView) {
           if textView == txtdescriptionEn {
               if textView.text == ""{
               textView.text = "Description(eng)"
               textView.textColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
               
               }
           }
           else if textView == txtdescriptionurdu {
               if textView.text == ""{
                   textView.text = "Description(urdu)"
                   textView.textColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
                  
               }
           }
           
           
       }
}
