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
    var productGallary = [Gallery]() // for  updating
    var imageGallery : AddGallery? // for upload
    var productdata : AddProductsModel?
    var ProimgsPath = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden =  false
        formConfig()
        self.txtvendorPrice.delegate =  self
        if checktype ==  true
        {
            self.title = "Edit Product"
            btnadproduct.setTitle("EDIT PRODUCT", for: .normal)
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
                self.ProimgsPath.removeAll()
                self.productGallary =  successResponse.gallery ?? []
                for item in self.productGallary {
                    self.ProimgsPath.append(item.file_path ?? "")
                }
                self.txttitleEn.text =  self.viewproduct?.product?.product_title_en
                self.txttitleUrdu.text =  self.viewproduct?.product?.product_title_urdu
                
                
                  self.catid = self.viewproduct?.category?.categories_id ?? 0
                self.subcatid = self.viewproduct?.subcategory?.subcategory_id ?? 0
                self.subcategoryApi(id: self.catid)
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
        

        
        headerView.viewSetUp(radius: Int(headerView.layer.frame.height / 2), color: #colorLiteral(red: 0.7955924273, green: 0.8120230436, blue: 0.8036844134, alpha: 1), borderwidth: 1)
       
        
   
        
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
        btnadproduct.roundButton()
        
    }

    
    
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
                 //Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
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
                   //Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
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
        }
//        else if txttitleUrdu.text == "" {
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Urdu Title", messagetype: 0)
//             return false
//        }
        else if  txtvendorPrice.text == "" {
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
       
        let totalValue = (salePrcie ?? 0) * (calculateCm)
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
        
        let dic:[String:Any] =  ["category_id": "\(self.catid)","subcategory_id":"\(self.subcatid)","child_subcategory_id":"\(self.childcatid)","product_title_en":txttitleEn.text!,"product_title_urdu":txttitleUrdu.text!,"vendor_price":txtvendorPrice.text!,"selling_price":txtsaleprice.text!,"stock_threshold":txtthreshhold.text!,"product_type":"1", "product_stock":txtstock.text!, "product_supply_ability":txtsupplyer.text!, "product_status":txtstatus.text!, "product_sku":txtsku.text!, "product_barcode":"",  "product_height": txtheight.text!, "product_weight": txtproductWeight.text!, "product_length":self.txtLength.text!,"product_width": self.txtwidth.text!,"featured_image":self.imageGallery?.image_paths?[0] ?? "","avatar": self.imageGallery?.image_paths ?? ""  ]
        
        
        print("Check Data",dic)
        
        
      
        
        ShareData.showProgress()
            
            
            
            userhandler.addProducts(parms: dic, Success: {successResponse in
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

    }
    
    
    func updateProductApi(){
            
        let dic:[String:Any] =  ["category_id": "\(self.catid)","subcategory_id":"\(self.subcatid)","child_subcategory_id":"\(self.childcatid)","product_title_en":txttitleEn.text!,"product_title_urdu":txttitleUrdu.text!,"vendor_price":txtvendorPrice.text!,"selling_price":txtsaleprice.text!,"stock_threshold":txtthreshhold.text!,"product_type":"1", "product_stock":txtstock.text!, "product_supply_ability":txtsupplyer.text!, "product_status":txtstatus.text!, "product_sku":txtsku.text!, "product_barcode":"",  "product_height": txtheight.text!,"product_weight": txtproductWeight.text!,"product_length":self.txtLength.text!,"product_width": self.txtwidth.text!, "featured_image": self.productGallary[0].file_path ?? "","avatar": self.ProimgsPath ]
           
            
        
        
        
         print(dic)
        
        
            ShareData.showProgress()
                
                
                
        userhandler.updateProducts(id:"\(self.viewproduct?.product?.products_id ?? 0)",parms: dic, Success: {successResponse in
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
                if self.ProImg.count != 0 {
                    self.uploadGalleryApi(img: self.ProImg)
                }
                picker.dismiss(animated: true, completion: nil)
            }
            
            
            
       

            present(picker, animated: true, completion: nil)
        }
    
}



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
                         
                } else {
                    
                }
        
    }
    
    
}
extension AddProductVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
   
    
    
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
    
    func uploadGalleryApi(img:[UIImage]) {
        ShareData.showProgress()
       
        
        userhandler.UplodGallery(img: img, Success: {successResponse in
            ShareData.hideProgress()
            self.imageGallery = successResponse
        }, Failure: {error in

            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        } )
    }

    
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
