//
//  AddProductVC.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 31/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DropDown
import YPImagePicker
import AVFoundation
import AVKit
import Photos
class AddProductVC: UIViewController,deleteImg, UITextFieldDelegate {
    
    
//    @IBOutlet weak var clViewSizes: UICollectionView!
//
//    @IBOutlet weak var clViewColor: UICollectionView!
    
    var productid = 0
    var checktype :  Bool?
    @IBOutlet weak var clView: UICollectionView!
    
    @IBOutlet weak var skuView: UIView!
    
    var cemeraimg = UIImagePickerController()
       var galleryimage = UIImagePickerController()
    var imageGallery : AddGallery?
//    @IBOutlet weak var stackStock: UIStackView!
//   // @IBOutlet weak var stackColor: UIStackView!
//    @IBOutlet weak var stackHeight: UIStackView!
    
    @IBOutlet weak var headerView: UIView!
    
    
    //@IBOutlet weak var vendorView: UIView!
    
    @IBOutlet weak var stockView: UIView!
    
    @IBOutlet weak var categoryView: UIView!
    
    @IBOutlet weak var subCategoryView: UIView!
    
    @IBOutlet weak var titleView: UIView!
   // @IBOutlet weak var supplyView: UIView!
    
   // @IBOutlet weak var productSizeView: UIView!
    @IBOutlet weak var productWeithView: UIView!
    
   // @IBOutlet weak var productColorView: UIView!
    
   // @IBOutlet weak var productHeightView: UIView!
    
    @IBOutlet weak var stastusView: UIView!
    
    @IBOutlet weak var vendorPriceView: UIView!
    
    @IBOutlet weak var imageView: UIView!
    
//    @IBOutlet weak var btnproductType: UIButton!
//    
//    @IBOutlet weak var btnVariable: UIButton!
    
    
    //@IBOutlet weak var discriptionView: UIView!
    
    
   // @IBOutlet weak var txtView: UITextView!
    
    
    @IBOutlet weak var btnadproduct: UIButton!
    
    
    
    
    @IBOutlet weak var supplyabilityView: UIView!
    
    @IBOutlet weak var threshView: UIView!
    
    @IBOutlet weak var stockProductView: UIView!
    
    
    //@IBOutlet weak var descriptionENView: UIView!
    
    //@IBOutlet weak var txtdescriptionEN: UITextView!
    
    //@IBOutlet weak var typeView: UIView!
    
   // @IBOutlet weak var viewheight: NSLayoutConstraint!
    
    
    @IBOutlet weak var btncategory: UIButton!
    
    @IBOutlet weak var txtcategory: UITextField!
    
    
    @IBOutlet weak var txtsubcategory: UITextField!
    
    @IBOutlet weak var btnsubcategory: UIButton!
    
    
    @IBOutlet weak var txtchildCategory: UITextField!
    
    
    @IBOutlet weak var btnChildCatgory: UIButton!
    
    @IBOutlet weak var txttitleEn: UITextField!
    
   // @IBOutlet weak var txttitleUr: UITextField!
    
    
    @IBOutlet weak var txtvendorPrice: UITextField!
    
    @IBOutlet weak var txtsupplyer: UITextField!
    
    
    @IBOutlet weak var btnstatus: UIButton!
    
    @IBOutlet weak var txtstatus: UITextField!
    
    @IBOutlet weak var txtthreshhold: UITextField!
    
    @IBOutlet weak var txtproductWeight: UITextField!
    
    @IBOutlet weak var txtsaleprice: UITextField!
    
   // @IBOutlet weak var txtHeight: UITextField!
    
   // @IBOutlet weak var txtproductcolor: UITextField!
    
    
   // @IBOutlet weak var txtproductSize: UITextField!
    
    
    @IBOutlet weak var titleUrduView: UIView!
    @IBOutlet weak var txtstock: UITextField!
    
    //@IBOutlet weak var txtdesriptionEn: UITextView!
    
    //@IBOutlet weak var txtdescriptionUr: UITextView!
    
    
    @IBOutlet weak var lengthView: UIView!
    
    @IBOutlet weak var widthView: UIView!
    
    @IBOutlet weak var HeightView: UIView!
    @IBOutlet weak var salePriceView: UIView!
    
    @IBOutlet weak var txttitleUrdu: UITextField!
    
    @IBOutlet weak var txtLength: UITextField!
    
    
    @IBOutlet weak var txtheight: UITextField!
    @IBOutlet weak var txtwidth: UITextField!
    
    
    
    
    
    
    @IBOutlet weak var txtsku: UITextField!
    var selectedItems = [YPMediaItem]()
    var CategoryDropdown = DropDown()
    var subCategoryDropdown = DropDown()
    var childCategoryDropdown = DropDown()
    var StatusDropdown = DropDown()
    var prodctsList = [AddGetCategories]()
    var subcategoryList = [AddProductGetSubcatgoriesSubcategories]()
    var childList = [AddproductGetChildsubcategories]()
    var comission = ""
    var ProImg = [UIImage]()
    var docurl = ""
    var catid = 0
    var subcatid = 0
    var childcatid = 0
    var viewproduct: ViewProductsModel?
    var productGallary = [Gallery]()
    var productdata : AddProductsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden =  false
        formConfig()
        self.txtvendorPrice.delegate =  self
        if checktype ==  true
        {
            self.title = "Edit Product"
            btnadproduct.setTitle("EIDT PRODUCT", for: .normal)
        }else {
        self.title = "Add Product"
        }
//        self.clViewSizes.register(UINib.init(nibName: "SizesCell", bundle: nil), forCellWithReuseIdentifier:"SizesCell")
//        self.clViewColor.register(UINib.init(nibName: "ColorCell", bundle: nil), forCellWithReuseIdentifier:"ColorCell")
//        clViewSizes.allowsMultipleSelection = true
        addBackButton()
         getvendorProductsApi()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.checktype ==  true {
            getViewPrpduct()
            getvendorProductsApi()
        }
    }
    
    
    
    func getViewPrpduct(){
        ShareData.showProgress()
        userhandler.viewVendorProduct(id: productid, Success: {successResponse in
            ShareData.hideProgress()
            if successResponse.status == 1 {
                self.viewproduct =  successResponse
                self.productGallary.removeAll()
                self.productGallary =  successResponse.gallery ?? []
                self.txttitleEn.text =  self.viewproduct?.product?.product_title_en
                self.txttitleUrdu.text =  self.viewproduct?.product?.product_title_urdu
                
                
                  self.catid = self.viewproduct?.category?.categories_id ?? 0
                self.subcatid = self.viewproduct?.subcategory?.subcategory_id ?? 0
                
                if self.viewproduct?.child_subcategory?.child_categories_id != nil {
                    self.txtchildCategory.text =  self.viewproduct?.child_subcategory?.child_subcategory_title_en
                   
                    self.childcatid = self.viewproduct?.child_subcategory?.child_categories_id ?? 0
                     self.subCategoryView.isHidden = false
                } else {
                     self.subCategoryView.isHidden = true
                }
                
                
                
                
                
                
                self.txtcategory.text =  self.viewproduct?.category?.category_title_en
              
                
                self.txtsubcategory.text =  self.viewproduct?.subcategory?.subcategory_title_en
                
                
                
                
                

                self.txtstatus.text =  self.viewproduct?.product?.product_status
                self.txtvendorPrice.text =  self.viewproduct?.product?.vendor_price
                self.txtsku.text =  self.viewproduct?.product?.product_sku
                self.txtsupplyer.text = self.viewproduct?.product?.product_supply_ability
                self.txtstock.text =  self.viewproduct?.product?.product_status
                self.txtthreshhold.text =  self.viewproduct?.product?.stock_threshold
                self.txtproductWeight.text =  self.viewproduct?.product?.product_weight
                self.txtstock.text =  self.viewproduct?.product?.product_stock
                self.txtLength.text = self.viewproduct?.product?.product_length
                self.txtheight.text = self.viewproduct?.product?.product_height
                self.txtwidth.text = self.viewproduct?.product?.product_width
                self.txtsaleprice.text = self.viewproduct?.product?.selling_price
//                self.txtdescriptionEN.text = self.viewproduct?.product?.product_description_en
//                self.txtdescriptionUr.text = self.viewproduct?.product?.product_description_urdu
                self.clView.reloadData()
            } else {
                 ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: successResponse.message!, messagetype: 0)
            }
        }, Failure: {error in
             ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func formConfig(){
        
//        txtView.delegate = self
//         txtView.textColor = UIColor.lightGray
//         txtView.text = "Discription(urdu)"
//        txtView.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
//
//
//        txtdescriptionEN.delegate = self
//         txtdescriptionEN.textColor = UIColor.lightGray
//         txtdescriptionEN.text = "Discription(en)"
//        txtdescriptionEN.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
        
        headerView.viewSetUp(radius: Int(headerView.layer.frame.height / 2), color: #colorLiteral(red: 0.7955924273, green: 0.8120230436, blue: 0.8036844134, alpha: 1), borderwidth: 1)
       
        
        //vendorView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        
//         stockView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//
//       categoryView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//
//         subCategoryView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//
//         titleView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
      //supplyView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        
      // productSizeView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
         //productWeithView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        
       // productColorView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        
      // productHeightView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        
//         stastusView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//
//       vendorPriceView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//
//
//        titleUrduView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//
//
//        supplyabilityView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//
//        threshView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//
//       stockProductView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//
//
//
//        lengthView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//
//         widthView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//
//         HeightView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//        salePriceView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//        self.skuView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
         
//        descriptionENView.layer.cornerRadius = 10
//        descriptionENView.layer.borderWidth = 1
//        descriptionENView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
//
//
//
//
//
//        discriptionView.layer.cornerRadius = 10
//        discriptionView.layer.borderWidth = 1
//        discriptionView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
        
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
        btnadproduct.roundButton()
        
    }


    
    
//    @IBAction func variableAction(_ sender: UIButton) {
//        btnVariable.setBackgroundImage(UIImage.init(named: "Tickfilled"), for: .normal)
//        btnproductType.setBackgroundImage(UIImage.init(named: "tick"), for: .normal)
//        viewheight.constant = 379
//
//        stackStock.isHidden = false
//       stackColor.isHidden = false
//        stackHeight.isHidden = false
//    }
    
//
//    @IBAction func simpleAction(_ sender: UIButton) {
//        btnVariable.setBackgroundImage(UIImage.init(named: "tick"), for: .normal)
//
//         btnproductType.setBackgroundImage(UIImage.init(named: "Tickfilled"), for: .normal)
//         viewheight.constant = 200
//
//         stackStock.isHidden = true
//        stackColor.isHidden = true
//         stackHeight.isHidden = true
//    }
    
    
    func getvendorProductsApi() {
        userhandler.getAddProductCategories(Success: {Response in
            if Response.success == 1{
                self.prodctsList =  Response.categories ?? []
            } else {
                 Zalert.ZshareAlert.showAlert(title: "Alert", message: Response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
        
    }
    
    
    
    @IBAction func categoryAction(_ sender: UIButton) {
        
        CategoryDropdown.anchorView = btncategory
                CategoryDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                CategoryDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            var categoryArray = [String]()
        categoryArray = prodctsList.map({$0.category_title_en!})
              
        CategoryDropdown.dataSource = categoryArray
                
                CategoryDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
                    print(index)
                    self.txtcategory.text = item
                    self.catid = self.prodctsList[index].categories_id!
                    self.subcategoryApi(id: self.prodctsList[index].categories_id!)

                }
                CategoryDropdown.show()
        
        
    }
    
    
    func subcategoryApi(id: Int) {
        userhandler.ProductAddGetSucCategories(id: id, Success: {response in
            if response.success == 1 {
                self.subcategoryList =  response.subcategories ?? []
            } else {
                 Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            
             Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    
    @IBAction func subCategoryAction(_ sender: UIButton) {
        
        subCategoryDropdown.anchorView = btnsubcategory
                subCategoryDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                subCategoryDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            var SubcategoryArray = [String]()
        SubcategoryArray = subcategoryList.map({$0.subcategory_title_en ?? ""})
              
        subCategoryDropdown.dataSource = SubcategoryArray
                
                subCategoryDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
                    print(index)
                    self.txtsubcategory.text = item
                    self.subcatid = self.subcategoryList[index].subcategory_id ?? 0
                    self.comission = self.subcategoryList[index].commission ?? ""
                    
                    self.ChildcategoryApi(id: self.subcategoryList[index].subcategory_id ?? 0)
                    

                }
                subCategoryDropdown.show()
    }
    
    
    func ChildcategoryApi(id: Int) {
           userhandler.ProductAddGetChildCategories(id: id, Success: {response in
               if response.success == 1  {
                self.subCategoryView.isHidden = false 
                self.childList =  response.childsubcategories ?? []
               } else {
                self.subCategoryView.isHidden = true
                   Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
               }
           }, Failure: {error in
                Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
           })
       }
    
    
    @IBAction func ChildCategoryAction(_ sender: UIButton) {
        
        childCategoryDropdown.anchorView = btnChildCatgory
                childCategoryDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                childCategoryDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            var SubcategoryArray = [String]()
        SubcategoryArray = childList.map({$0.child_subcategory_title_en ?? ""})
              
        childCategoryDropdown.dataSource = SubcategoryArray
                
                childCategoryDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
                    print(index)
                    self.txtchildCategory.text = item
                    self.childcatid = self.childList[index].child_categories_id ?? 0
                   

                }
                childCategoryDropdown.show()
    }
    
    
    
    @IBAction func statusAction(_ sender: UIButton) {
        StatusDropdown.anchorView = btnstatus
                StatusDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                StatusDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            
       
              
        StatusDropdown.dataSource = ["In review","Active","In active"]
                
                StatusDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
                    print(index)
                    self.txtstatus.text = item
                   
                   

                }
                StatusDropdown.show()
    }
    
    
    
    func checkData() -> Bool {
        
        if txtcategory.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please  Select The Category", messagetype: 0)
            return false
        } else if txtsubcategory.text == "" {
             Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please  Select The Sub Category", messagetype: 0)
             return false
        } else if txttitleEn.text == "" {
             Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Englisg Title", messagetype: 0)
             return false
        } else if txttitleUrdu.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Urdu Title", messagetype: 0)
             return false
        } else if  txtvendorPrice.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Vendor Price", messagetype: 0)
             return false
        } else if txtsupplyer.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Supply Ability", messagetype: 0)
                    return false
        } else if txtstatus.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Status", messagetype: 0)
                        return false
        } else if txtthreshhold.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter ThreshHold Value", messagetype: 0)
                        return false
        } else if txtproductWeight.text == ""{
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter weight", messagetype: 0)
                        return false
        } else if txtsku.text == ""{
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter the SKU", messagetype: 0)
                        return false
        }
        else if txtstock.text == ""{
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter the Stock", messagetype: 0)
                        return false
        } else if txtstock.text == ""{
                   Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter the Stock", messagetype: 0)
                               return false
               }
//        else if txtdescriptionUr.text == ""{
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter the Discription In (Urdu)", messagetype: 0)
//                        return false
//        }else if txtdescriptionEN.text == ""{
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter the Discription In (English)", messagetype: 0)
//                        return false
//        }
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let salePrcie = Float(self.txtvendorPrice.text!)
        let calculateCm = (Float(self.comission) ?? 0) / 100
       
        let totalValue = (salePrcie!) * (calculateCm)
        let sumcm = totalValue + salePrcie!
        self.txtsaleprice.text = "\(sumcm)"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func addproductAction(_ sender: UIButton) {
        
        if checkData() {
            if self.checktype ==  true {
                updateProductApi()
            } else {
            createProductApi()
            }
        }
    }
    
    
    
    
    func createProductApi(){
        
        let dic:[String:Any] =  ["category_id": "\(self.catid)","subcategory_id":"\(self.subcatid)","child_subcategory_id":"\(self.childcatid)","product_title_en":txttitleEn.text!,"product_title_urdu":txttitleUrdu.text!,"vendor_price":txtvendorPrice.text!,"selling_price":txtsaleprice.text!,"stock_threshold":txtthreshhold.text!,"product_type":"1", "product_stock":txtstock.text!, "product_supply_ability":txtsupplyer.text!, "product_status":txtstatus.text!, "product_sku":txtsku.text!, "product_barcode":"",  "product_height": txtheight.text!, "product_weight": txtproductWeight.text!]
        
        
        print("Check Data",dic)
        
        
       // userhandler.UplodGallery(img: img, Success: {successResponse in
        //            ShareData.hideProgress()
        //            self.imageGallery = successResponse
        //        }, Failure: {error in
        //
        //            ShareData.hideProgress()
        //            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        //        } )
        
        ShareData.showProgress()
            
            
            
            userhandler.addProducts(parms: dic, img: ProImg, Success: {successResponse in
                ShareData.hideProgress()
                if successResponse.success == 1 {
                    Zalert.ZshareAlert.showAlert(title: "Alert", message: successResponse.message!, messagetype: 1)
                    self.navigationController?.popViewController(animated: true)
                }else {
                    ShareData.hideProgress()
                    Zalert.ZshareAlert.showAlert(title: "Alert", message: successResponse.message!, messagetype: 0)
                }
            }, Failure: {error in
                ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
            })
//        userhandler.addProducts(param: dic , Success: {successResponse in
//            ShareData.hideProgress()
//            if successResponse.success == 1 {
//                Zalert.ZshareAlert.showAlert(title: "Alert", message: successResponse.message!, messagetype: 1)
//                self.navigationController?.popViewController(animated: true)
//            } else {
//                ShareData.hideProgress()
//                Zalert.ZshareAlert.showAlert(title: "Alert", message: successResponse.message!, messagetype: 0)
//            }
//        }, Failure: {error in
//            ShareData.hideProgress()
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
//        })
    }
    
    
    func updateProductApi(){
            
            let dic:[String:Any] =  ["category_id": "\(self.catid)","subcategory_id":"\(self.subcatid)","child_subcategory_id":"\(self.childcatid)","product_title_en":txttitleEn.text!,"product_title_urdu":txttitleUrdu.text!,"vendor_price":txtvendorPrice.text!,"selling_price":txtsaleprice.text!,"stock_threshold":txtthreshhold.text!,"product_type":"1", "product_stock":txtstock.text!, "product_supply_ability":txtsupplyer.text!, "product_status":txtstatus.text!, "product_sku":txtsku.text!, "product_barcode":"",  "product_height": txtheight.text!,"product_weight": txtproductWeight.text!]
           // userhandler.UplodGallery(img: img, Success: {successResponse in
            //            ShareData.hideProgress()
            //            self.imageGallery = successResponse
            //        }, Failure: {error in
            //
            //            ShareData.hideProgress()
            //            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
            //        } )
            
        
         print(dic)
        
        
            ShareData.showProgress()
                
                
                
        userhandler.updateProducts(id:"\(self.viewproduct?.product?.products_id ?? 0)",parms: dic, img: ProImg, Success: {successResponse in
                    ShareData.hideProgress()
                    if successResponse.success == 1 {
                        Zalert.ZshareAlert.showAlert(title: "Alert", message: successResponse.message!, messagetype: 1)
                        self.navigationController?.popViewController(animated: true)
                    }else {
                        ShareData.hideProgress()
                        Zalert.ZshareAlert.showAlert(title: "Alert", message: successResponse.message!, messagetype: 0)
                    }
                }, Failure: {error in
                    ShareData.hideProgress()
                    Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
                })
    //        userhandler.addProducts(param: dic , Success: {successResponse in
    //            ShareData.hideProgress()
    //            if successResponse.success == 1 {
    //                Zalert.ZshareAlert.showAlert(title: "Alert", message: successResponse.message!, messagetype: 1)
    //                self.navigationController?.popViewController(animated: true)
    //            } else {
    //                ShareData.hideProgress()
    //                Zalert.ZshareAlert.showAlert(title: "Alert", message: successResponse.message!, messagetype: 0)
    //            }
    //        }, Failure: {error in
    //            ShareData.hideProgress()
    //            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
    //        })
        }
    
    
    
    
    
    
    
    
    
    func PickImag()
    {
        let alert = UIAlertController(title: "Please Select an Option", message: "", preferredStyle: .actionSheet)
        
        let Gallry = UIAlertAction(title: "Photo Library", style: .default){ (Picimg) in self.GalleryPic()
        }
        let camraimg = UIAlertAction(title: "Camera", style: .default){ (ac) in self.cemeraPic()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){(action) in self.cancel()
            
        }
        
        alert.addAction(Gallry)
        alert.addAction(camraimg)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    func cancel()
    {
        self.galleryimage.dismiss(animated: true, completion: nil)
    }
    
    func cemeraPic()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            cemeraimg.sourceType = .camera
            cemeraimg.delegate = self
            cemeraimg.allowsEditing = false
            present(cemeraimg, animated: true, completion: nil)
        }
        else {
            
            let alert = UIAlertController(title: "Camera", message: "Camera is not available", preferredStyle: .actionSheet)
            let alertaction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(alertaction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    func GalleryPic()
    {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        {
            galleryimage.delegate = self
            galleryimage.allowsEditing = false
            galleryimage.sourceType = UIImagePickerController.SourceType.photoLibrary
            present(galleryimage, animated: true, completion: nil)
            
        }else{
            
            print("Image is not Available")
            
        }
        
    }
    
    
    
    
    
    
    

        func showPicker() {
            
            var config = YPImagePickerConfiguration()

            /* Uncomment and play around with the configuration 👨‍🔬 🚀 */

            /* Set this to true if you want to force the  library output to be a squared image. Defaults to false */
    //         config.library.onlySquare = true

            /* Set this to true if you want to force the camera output to be a squared image. Defaults to true */
            // config.onlySquareImagesFromCamera = false

            /* Ex: cappedTo:1024 will make sure images from the library or the camera will be
               resized to fit in a 1024x1024 box. Defaults to original image size. */
            // config.targetImageSize = .cappedTo(size: 1024)

            /* Choose what media types are available in the library. Defaults to `.photo` */
            config.library.mediaType = .photoAndVideo

            /* Enables selecting the front camera by default, useful for avatars. Defaults to false */
            // config.usesFrontCamera = true

            /* Adds a Filter step in the photo taking process. Defaults to true */
            // config.showsFilters = false

            /* Manage filters by yourself */
    //        config.filters = [YPFilter(name: "Mono", coreImageFilterName: "CIPhotoEffectMono"),
    //                          YPFilter(name: "Normal", coreImageFilterName: "")]
    //        config.filters.remove(at: 1)
    //        config.filters.insert(YPFilter(name: "Blur", coreImageFilterName: "CIBoxBlur"), at: 1)

            /* Enables you to opt out from saving new (or old but filtered) images to the
               user's photo library. Defaults to true. */
            config.shouldSaveNewPicturesToAlbum = false

            /* Choose the videoCompression. Defaults to AVAssetExportPresetHighestQuality */
            config.video.compression = AVAssetExportPresetMediumQuality
            
            /* Defines the name of the album when saving pictures in the user's photo library.
               In general that would be your App name. Defaults to "DefaultYPImagePickerAlbumName" */
            // config.albumName = "ThisIsMyAlbum"

            /* Defines which screen is shown at launch. Video mode will only work if `showsVideo = true`.
               Default value is `.photo` */
            config.startOnScreen = .library

            /* Defines which screens are shown at launch, and their order.
               Default value is `[.library, .photo]` */
            config.screens = [.library, .photo]
            
            /* Can forbid the items with very big height with this property */
    //        config.library.minWidthForItem = UIScreen.main.bounds.width * 0.8

            /* Defines the time limit for recording videos.
               Default is 30 seconds. */
            // config.video.recordingTimeLimit = 5.0

            /* Defines the time limit for videos from the library.
               Defaults to 60 seconds. */
            config.video.libraryTimeLimit = 500.0

            /* Adds a Crop step in the photo taking process, after filters. Defaults to .none */
            config.showsCrop = .rectangle(ratio: (16/9))

            /* Defines the overlay view for the camera. Defaults to UIView(). */
            // let overlayView = UIView()
            // overlayView.backgroundColor = .red
            // overlayView.alpha = 0.3
            // config.overlayView = overlayView

            /* Customize wordings */
            config.wordings.libraryTitle = "Gallery"

            /* Defines if the status bar should be hidden when showing the picker. Default is true */
            config.hidesStatusBar = false

            /* Defines if the bottom bar should be hidden when showing the picker. Default is false */
            config.hidesBottomBar = false
            
            config.maxCameraZoomFactor = 2.0

            config.library.maxNumberOfItems = 5
            config.gallery.hidesRemoveButton = false
            config.showsCrop = .none
            /* Disable scroll to change between mode */
            // config.isScrollToChangeModesEnabled = false
             //config.library.minNumberOfItems = 5
            
            /* Skip selection gallery after multiple selections */
            // config.library.skipSelectionsGallery = true

            /* Here we use a per picker configuration. Configuration is always shared.
               That means than when you create one picker with configuration, than you can create other picker with just
               let picker = YPImagePicker() and the configuration will be the same as the first picker. */
            
            
            /* Only show library pictures from the last 3 days */
            //let threDaysTimeInterval: TimeInterval = 3 * 60 * 60 * 24
            //let fromDate = Date().addingTimeInterval(-threDaysTimeInterval)
            //let toDate = Date()
            //let options = PHFetchOptions()
            //options.predicate = NSPredicate(format: "creationDate > %@ && creationDate < %@", fromDate as CVarArg, toDate as CVarArg)
            //
            ////Just a way to set order
            //let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: true)
            //options.sortDescriptors = [sortDescriptor]
            //
            //config.library.options = options

            config.library.preselectedItems = selectedItems
            
            let picker = YPImagePicker(configuration: config)

            /* Change configuration directly */
            // YPImagePickerConfiguration.shared.wordings.libraryTitle = "Gallery2"
            

            /* Multiple media implementation */
//            picker.didFinishPicking { [unowned picker] items, cancelled in
//
//                if cancelled {
//                    print("Picker was canceled")
//                    picker.dismiss(animated: true, completion: nil)
//                    return
//                }
//                _ = items.map { print("🧀 \($0)") }
//
//                self.selectedItems = items
//
//                if let firstItem = items.first {
//                    switch firstItem {
//                    case .photo(let photo):
//                        print("i am image", photo.image)
//                        //self.uploadGalleryApi(img: [photo.image])
//                        //self.selectedImageV.image = photo.image
//                        picker.dismiss(animated: true, completion: nil)
//                    case .video(let video):
//                        //self.selectedImageV.image = video.thumbnail
//
//                        let assetURL = video.url
//                        let playerVC = AVPlayerViewController()
//                        let player = AVPlayer(playerItem: AVPlayerItem(url:assetURL))
//                        playerVC.player = player
//
//                        picker.dismiss(animated: true, completion: { [weak self] in
//                            self?.present(playerVC, animated: true, completion: nil)
//                            //print("😀 \(String(describing: self?.resolutionForLocalVideo(url: assetURL)!))")
//                        })
//                    }
//                }
//            }

            
            
            picker.didFinishPicking { [unowned picker] items, cancelled in
                for item in items {
                    switch item {
                    case .photo(let photo):
                        self.ProImg.append(photo.image)
                        print("i am here ",photo.image)
                    case .video(let video):
                        print(video)
                    }
                }
                self.clView.reloadData()
                //self.uploadGalleryApi(img: self.ProImg)
                picker.dismiss(animated: true, completion: nil)
            }
            
            
            
            
            
            
            
            /* Single Photo implementation. */
            // picker.didFinishPicking { [unowned picker] items, _ in
            //     self.selectedItems = items
            //     self.selectedImageV.image = items.singlePhoto?.image
            //     picker.dismiss(animated: true, completion: nil)
            // }

            /* Single Video implementation. */
            //picker.didFinishPicking { [unowned picker] items, cancelled in
            //    if cancelled { picker.dismiss(animated: true, completion: nil); return }
            //
            //    self.selectedItems = items
            //    self.selectedImageV.image = items.singleVideo?.thumbnail
            //
            //    let assetURL = items.singleVideo!.url
            //    let playerVC = AVPlayerViewController()
            //    let player = AVPlayer(playerItem: AVPlayerItem(url:assetURL))
            //    playerVC.player = player
            //
            //    picker.dismiss(animated: true, completion: { [weak self] in
            //        self?.present(playerVC, animated: true, completion: nil)
            //        print("😀 \(String(describing: self?.resolutionForLocalVideo(url: assetURL)!))")
            //    })
            //}

            present(picker, animated: true, completion: nil)
        }
    
}


//extension AddProductVC: UITextViewDelegate{
//
//
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text == "Discription(en)" {
//            textView.text = ""
//            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
//
//        }
//        else if textView.text == "Discription(urdu)"{
//
//            textView.text = ""
//            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
//
//        }
//
//
//    }
//
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if text == "\n" {
//            textView.resignFirstResponder()
//        }
//        return true
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView == txtdescriptionEN {
//            if textView.text == ""{
//            textView.text = "Discription(en)"
//            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
//
//            }
//        }
//        else if textView == txtdescriptionUr {
//            if textView.text == ""{
//                textView.text = "Discription(urdu)"
//                textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
//
//            }
//        }
//
//
//    }
//
//
//
//
//
//
//}

extension AddProductVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        
            return 2
            
       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       
        
                if section == 0 {
                    return 1
                } else {
                    if self.checktype == false {
                        return self.ProImg.count
                    } else {
                        return self.productGallary.count
                    }
                }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
                if indexPath.section == 0 {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddImageCell", for: indexPath) as? AddImageCell
                    return cell!
                } else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewImageCell", for: indexPath) as? ViewImageCell
                    
                    if self.checktype ==  true {
                        cell?.setData(model: productGallary[indexPath.row])
                    } else {
                        
                        cell?.img.image =  ProImg[indexPath.row] //setPath(string: self.imageGallery?.image_paths![indexPath.row], "")
                        
                    }
                    cell?.delegate =  self
                    return cell!
                }
     
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
                if  indexPath.section == 0 {
                    showPicker()
                         //PickImag()
                } else {
                    
                }
        
    }
    
    
}
extension AddProductVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        self.ProImg.removeAll()
        self.ProImg.append(img)
        self.clView.reloadData()
        //self.docimg = img
        //uploadGalleryApi(img:self.ProImg)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func deleteproductImg(cell: ViewImageCell) {
        let index =  clView.indexPath(for: cell)
        if checktype ==  true {
            
            deleteImgGallery(id:productGallary[(index?.row)!].gallery_id ?? 0)
            productGallary.remove(at: index!.row)
        }else {
            self.ProImg.remove(at: index!.row)
        }
        self.clView.reloadData()
        
    }
//    func uploadGalleryApi(img:[UIImage]) {
//        ShareData.showProgress()
//        userhandler.UplodGallery(img: img, Success: {successResponse in
//            ShareData.hideProgress()
//            self.imageGallery = successResponse
//        }, Failure: {error in
//
//            ShareData.hideProgress()
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
//        } )
//    }

    
    func deleteImgGallery(id:Int){
        userhandler.deleteGalleryProduct(id: id, Success: {response in
            ShareData.hideProgress()
            if response.success ==  1 {

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
