//
//  VariationListVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class VariationListVC: UIViewController {
  var variationid = 0
    var productid = 0
   // @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var deleteView: UIView!
    @IBOutlet weak var lbltitleUrdu: UILabel!
    @IBOutlet weak var lbltitleEn: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lblstock: UILabel!
    
    @IBOutlet weak var editView: UIView!
    
    var attributsList =  [Attributes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.tableFooterView =  UIView(frame: .zero)
        addBackButton()
        editView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
               deleteView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        self.title = "Variation List"
        //tblView.register(UINib.init(nibName: "VariationListCell", bundle: nil), forCellReuseIdentifier: "VariationListCell")
        
        self.tblView?.register(UINib.init(nibName: "CategoryHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "CategoryHeader")
         self.tblView.register(UINib.init(nibName: "VariationCell", bundle: nil), forCellReuseIdentifier: "VariationCell")
        
        self.tblView.register(UINib.init(nibName: "ColorCell", bundle: nil), forCellReuseIdentifier: "ColorCell")
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        variationDetailApi()
    }
    
    func variationDetailApi(){
        ShareData.showProgress()
        userhandler.getVariationDetail(id: variationid, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.variationid = (response.variation?.variation_id)!
                print("variationid",response.variation?.variation_id)
                self.variationid = (response.variation?.variation_id)!
                self.lblprice.text = "VariAtion Price : " + (response.variation?.variation_price)!
                self.lblstock.text = "VariAtion Stock : " + (response.variation?.variation_stock)!
                self.lbltitleEn.text =  "VariAtion Title(en) : " + (response.variation?.variation_title_en)!
                self.lbltitleUrdu.text = "VariAtion title(urdu) : " + (response.variation?.variation_title_urdu)!
                self.attributsList =  response.variation?.attributes ?? []
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
    
    @IBAction func editAction(_ sender: UIButton) {
        
        
        if UIDevice.current.userInterfaceIdiom == .pad {
                     
                     let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                     let vc =  storyBoard.instantiateViewController(withIdentifier: "AddVeriationVC") as? AddVeriationVC
                           vc?.variationid = variationid
            vc?.checktype = false
                     self.navigationController?.pushViewController(vc!, animated: true)

                     } else {

                     let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                     let vc =  storyBoard.instantiateViewController(withIdentifier: "AddVeriationVC") as? AddVeriationVC
                         vc?.variationid = variationid
                       vc?.checktype = false 
                     self.navigationController?.pushViewController(vc!, animated: true)
                     }
        
       
    }
    
    
    @IBAction func deleteAction(_ sender: UIButton) {
        
        
        
        let alert = UIAlertController(title: "Alert", message: "Would you like to Delete This Variation", preferredStyle: UIAlertController.Style.alert)

                     
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {action in
            self.deleteVariation()
        }))
                      alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

                     
                      self.present(alert, animated: true, completion: nil)
        
        
        
     
    }
    
    
    
    
    func deleteVariation(){
        let dic : [String:Any] = ["variation_id": self.variationid]
             
                    userhandler.deleteVariation(params: dic, Success: {response in
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


extension VariationListVC:  UITableViewDataSource,UITableViewDelegate,VariationHeaderDelegate {
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {


        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier:"CategoryHeader") as? CategoryHeader {

            let AttributeList = self.attributsList[section]

            headerView.loadHeaderView1(object: AttributeList, section: section)
            
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
            
            return attribute.vals!.count
            
        }
        else{
            return 0
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
   
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if attributsList[indexPath.section].attribute_title?.attribute_title == "Color" {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") as? ColorCell  else { return UITableViewCell() }
            let attribute = self.attributsList[indexPath.section]
           
        if let attributeValues = attribute.vals?[indexPath.row] {
                cell.loadCell1(object: attributeValues)
         }
            cell.accessoryType = .checkmark
//             if attribute.attribute_values?[indexPath.row].selected ?? false{
//
//                       tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
//                     cell.accessoryType = .checkmark
//                    } else {
//
//                       tableView.deselectRow(at: indexPath, animated: false)
//                    cell.accessoryType = .none
//                    }
            
            return cell
    } else {
    
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VariationCell") as? VariationCell  else { return UITableViewCell() }
        let attribute = self.attributsList[indexPath.section]
       
    if let attributeValues = attribute.vals?[indexPath.row] {
            cell.loadCell1(object: attributeValues)
     }
         cell.accessoryType = .checkmark
//         if attribute.attribute_values?[indexPath.row].selected ?? false{
//
//                   tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
//                 cell.accessoryType = .checkmark
//                } else {
//
//                   tableView.deselectRow(at: indexPath, animated: false)
//                cell.accessoryType = .none
//                }
        
        return cell
    }
    }
    func toggleSection(header:CategoryHeader, section: Int) {
        let category = self.attributsList[section]
        print(category.attribute_title)
        if category.isSelected == true {
            category.isSelected = false
            header.arrowDown.image = UIImage(named: "dropdown")
        }
        else{
           category.isSelected = true
           header.arrowDown.image = UIImage(named: "dropdown-1")
        }
        
        tblView.beginUpdates()
        tblView.reloadSections([section], with: .fade)
        tblView.endUpdates()
        
    }
    
//
//   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//       let attrilist =  self.attributsList[indexPath.section]
//
//
//
//         attrilist.attribute_values![indexPath.row].selected =  true
//
//    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//           tblView.reloadData()
//
//
//
////var dictionary = [Int:[String]]()
//
//     //attrr["\(attrilist.attribute_id ?? 0)"]?.append(attrilist.attribute_values![indexPath.row].attribute_values_id ?? 0)
////  attrr["\(attrilist.attribute_id ?? 0)",default: [Int]()].append(attrilist.attribute_values![indexPath.row].attribute_values_id ?? 0)
////    print(self.attrr)
//    //self.attrr["2",de]
////    if self.attrr["\(attrilist.attribute_id ?? 0)"] == nil{
////        self.attrr.removeAll()
////       self.attrr["\(attrilist.attribute_id ?? 0)"]  = [attrilist.attribute_values![indexPath.row].attribute_values_id ?? 0]
////        print(self.attrr)
////    } else {
////     self.attrr["\(attrilist.attribute_id ?? 0)"]?.append(attrilist.attribute_values![indexPath.row].attribute_values_id ?? 0)
////     print(self.attrr)
////     }
//
////    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
////    tblView.reloadData()
//
//    }
    
    
    
//    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//       let attrilist =  self.attributsList[indexPath.section]
//         tableView.cellForRow(at: indexPath)?.accessoryType = .none
//         attrilist.attribute_values![indexPath.row].selected =  false
//        //print(self.attrr["\(attrilist.attribute_id ?? 0)"]!.count,indexPath.row )
//
////        if  self.attrr["\(attrilist.attribute_id ?? 0)"]?.isEmpty != nil && self.attrr["\(attrilist.attribute_id ?? 0)"]!.count >= indexPath.row{
////
////            tableView.cellForRow(at: indexPath)?.accessoryType = .none
////            attrilist.attribute_values![indexPath.row].selected =  false
////
////
////            //self.attrr["\(attrilist.attribute_id ?? 0)"]?.remove(at: indexPath.row   )
////        //self.attrr["\(attrilist.attribute_id ?? 0)", default: []].remove(at: indexPath.row )
////        }
//           // print(attrr)
////        tblView.beginUpdates()
////        tblView.endUpdates()
//     tblView.reloadData()
//    }
    
}
