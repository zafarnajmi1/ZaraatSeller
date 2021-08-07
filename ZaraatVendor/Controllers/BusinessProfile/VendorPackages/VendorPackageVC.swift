//
//  VendorPackageVC.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 05/05/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
 import DropDown
class VendorPackageVC: BaseVC,deleteFeature {
    

    //@IBOutlet weak var btntop: NSLayoutConstraint!
    
    //@IBOutlet weak var lblpkg: UILabel!
    @IBOutlet weak var txtcategory: UITextField!
    
    @IBOutlet weak var btncategory: UIButton!
    
    @IBOutlet weak var vendorTypeView: UIView!
    @IBOutlet weak var txtvendortype: UITextField!
    @IBOutlet weak var viewCategory: UIView!
    
    @IBOutlet weak var btnvendrotype: UIButton!
    // @IBOutlet weak var viewSubcategory: UIView!
    
   // @IBOutlet weak var txtsubcategory: UITextField!
    
   // @IBOutlet weak var btnsubcategory: UIButton!
    
   // @IBOutlet weak var viewchildCategory: UIView!
    
    //@IBOutlet weak var txtchildCategory: UITextField!
    
    @IBOutlet weak var btnnext: UIButton!
    //@IBOutlet weak var btnChildCategory: UIButton!
   // @IBOutlet weak var viewpackage: UIView!
    
   // @IBOutlet weak var txtpkg: UITextField!
    
    @IBOutlet weak var clView: UICollectionView!
    
    @IBOutlet weak var featuredListView: UIView!
    
    
    
    
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        let height = clView.collectionViewLayout.collectionViewContentSize.height
//        clHeight.constant = height + 20
//        self.view.layoutIfNeeded()
    }
    
    @IBOutlet weak var marketView: UIView!
    @IBOutlet weak var txtmarket: UITextField!
    @IBOutlet weak var btnMarket: UIButton!
    
    @IBOutlet weak var clHeight: NSLayoutConstraint!
   // @IBOutlet weak var btnpkg: UIButton!
     var params = PostParams()
    var MarketdropDown = DropDown()
    var CategorydropDown = DropDown()
    var VendorTypedropDown = DropDown()
    var PkgDown = DropDown()
    var categoriesList = [Vendorcategories]()
    var SubcategoriesList = [Vendorsubcategories]()
    var childCategoriesList = [Vendorchildsubcategories]()
    var pkglist = [Package]()
    var listOfFeature = [String]()
    
     var fromMyaccount = false
    var  editvendorsBProfile : EditBusinessProfileVendors?
     var  editvendorsBProfileCategories = [EditBusinessProfileCategories]()
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Business Profile"
        setuppkg()
        addBackButton()
        self.title = "Select Category"
        clView.register(UINib.init(nibName: "VendortypeCell", bundle: nil), forCellWithReuseIdentifier: "VendortypeCell")
        self.setUpVenroType()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addBackButton()
        self.navigationController?.navigationBar.isHidden =  false
        setNavigationBar()
        
        if ShareData.shareInfo.userInfo?.vendors?.status == 1 {
            btnMarket.isUserInteractionEnabled =  false
        } else {
            btnMarket.isUserInteractionEnabled =  true
        }
        UIApplication.shared.setStatusBar()
        if fromMyaccount ==  true {
//             addBackButton()
//            self.navigationController?.navigationBar.isHidden =  false
            //btnMarket.isUserInteractionEnabled =  false
            editprofileApiCall()
        } else {
            btnMarket.isUserInteractionEnabled =  true
        }
    }
    
    //override func hidnavigationbar() {
      //  self.navigationController?.navigationBar.isHidden =  false
   // }
    func setUpVenroType(){
        // viewpackage.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//        marketView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//        viewCategory.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//        vendorTypeView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
    }
    
    
    func editprofileApiCall() {
        print(params.params)
        print("id : ",ShareData.shareInfo.userInfo?.vendors?.vendor_id!)
                  ShareData.showProgress()
        let dic: [String:Any] = ["vendor_id":ShareData.shareInfo.userInfo?.vendors?.vendor_id! ?? ""]
                  userhandler.editbusinessProfile(parms: dic, Success: {response in
                      ShareData.hideProgress()
                      if response.success == 1 {
                        self.editvendorsBProfile =  response.vendors
                        self.editvendorsBProfileCategories =  response.categories ?? []
                        self.setUpEditBProfile()
                      } else {
                          ShareData.hideProgress()
                          Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
                      }
                      
                  }, Failure: {error in
                      ShareData.hideProgress()
                       Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
                  })
    }
    
    
    
    func setUpEditBProfile() {
        if  self.editvendorsBProfile?.market != "null" {
        self.txtmarket.text =  self.editvendorsBProfile?.market
        self.params.params.updateValue(self.editvendorsBProfile?.market! ?? "", forKey:"market" )
        self.txtvendortype.text = self.editvendorsBProfile?.vendor_type
         self.params.params.updateValue(self.editvendorsBProfile?.vendor_type ?? "", forKey:"vendor_type" )
        //self.txtpkg.text =  self.editvendorsBProfile?.package_name
         self.params.params.updateValue("1", forKey:"package" )
        for item in editvendorsBProfileCategories {
            
            if self.listOfFeature.contains(item.category_title_en!) {
                print("We've got \(item)!")
            } else {
                self.listOfFeature.append(item.category_title_en!)
                self.params.features.append(item.categories_id!)
                
            }
            
//            self.listOfFeature.append(item.category_title_en!)
//            self.params.features.append(item.categories_id!)
        }
        self.clView.reloadData()
        
        
//        self.txtcategory.text = editvendorsBProfile?.category_title_en
////        self.txtsubcategory.text = editvendorsBProfile?.child_subcategory_title_en
////        self.txtchildCategory.text = editvendorsBProfile?.child_subcategory_title_en
//        self.txtpkg.text = editvendorsBProfile?.package_name
//        self.params.params.updateValue(self.editvendorsBProfile?.categories_id! ?? "" , forKey:"vendor_category_id" )
        
          self.categoriApiCall(marketType:self.editvendorsBProfile?.market! ?? "")
        }
    }
    
    
//    override func hidnavigationbar() {
//        self.navigationController?.navigationBar.isHidden =  false
//    }
    func setuppkg(){
         mainView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        btnnext.roundButton()
    }
    
    
    @IBAction func marketAction(_ sender: UIButton) {
        
                        MarketdropDown.anchorView = btnMarket
                        MarketdropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                        MarketdropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


                     
                
                MarketdropDown.dataSource = ["b2b","ecommerce"]

                        MarketdropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                            print(index)
                            self.txtmarket.text = item
                           
                        
                         if item == "b2b" || item == "ecommerce" {
                             self.txtcategory.text = ""
                               self.listOfFeature.removeAll()
                            }
                            self.clView.reloadData()
                            
                            
                            
                            
                            
                            self.params.params.updateValue(item, forKey:"market" )
                            self.categoriApiCall(marketType:item)
                            
                        
        //                    self.subgategorapicall(id:self.categoriesList[index].categories_id)

                        }
                        MarketdropDown.show()
        
    }
    
    
    
    
    
    
    
    func categoriApiCall(marketType:String){
        let dic : [String:Any] = ["market":marketType]
        userhandler.getCategries(parms:dic , Success: {response in
            if response.success == 1 {
                self.categoriesList = response.vendorcategories ?? []
            } else {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    @IBAction func categoryAction(_ sender: Any) {


               CategorydropDown.anchorView = btncategory
                CategorydropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                CategorydropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


              var categoryArray = [String]()
        categoryArray = categoriesList.map({$0.category_title_en!})
        CategorydropDown.dataSource = categoryArray

                CategorydropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                    print(index)
                    self.txtcategory.text = item
                    //self.txtsubcategory.text = ""
                    if self.listOfFeature.contains(item) {
                        print("We've got \(item)!")
                    } else {
                       self.listOfFeature.append(item)
                        self.params.features.append(self.categoriesList[index].categories_id!)
                        
                    }
//
                    
                    self.clView.reloadData()
                    //self.params.params.updateValue(self.categoriesList[index].categories_id!, forKey:"vendor_category_id" )
//                    self.subgategorapicall(id:self.categoriesList[index].categories_id)

                }
                CategorydropDown.show()





    }
    
    
//    func subgategorapicall(id:Int?) {
//        userhandler.getSubCategries(id: id, Success: {response in
//            if response.success == 1 {
//                self.SubcategoriesList = response.vendorsubcategories ?? []
//                if response.data == 1 {
//                    self.lblpkg.isHidden =  false
//                    self.viewpackage.isHidden =  false
//                    self.btntop.priority =    UILayoutPriority(rawValue: 250)
//                    self.pkglist = response.package ?? []
//                }else {
//                    self.lblpkg.isHidden =  true
//                    self.viewpackage.isHidden =  true
//                    self.btntop.priority =    UILayoutPriority(rawValue: 750)
//                }
//            }else {
//                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
//            }
//        }, Failure: {error in
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
//        })
//    }
    
//    @IBAction func subcategoryaction(_ sender: Any) {
//
//            SubCategorydropDown.anchorView = btnsubcategory
//            SubCategorydropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            SubCategorydropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//        var subcategoryArray = [String]()
//        subcategoryArray = SubcategoriesList.map({$0.subcategory_title_en!})
//
//            SubCategorydropDown.dataSource = subcategoryArray
//
//            SubCategorydropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//                print(index)
//                self.txtsubcategory.text = item
//                self.txtchildCategory.text = ""
//                self.params.params.updateValue(self.SubcategoriesList[index].subcategory_id! , forKey:"vendor_subcategory_id" )
//
//                self.childcateGoriesApiCall(id: self.SubcategoriesList[index].subcategory_id!)
//            }
//            SubCategorydropDown.show()
//    }
    
    
//    func childcateGoriesApiCall(id: Int?) {
//        userhandler.getChildCategory(id: id, Success: {response in
//            if response.success == 1 {
//                self.childCategoriesList = response.vendorchildsubcategories ?? []
//                if response.data == 1 {
//                    self.lblpkg.isHidden =  false
//                    self.viewpackage.isHidden =  false
//                    self.btntop.priority =    UILayoutPriority(rawValue: 250)
//                    //self.pkglist = response.package ?? []
//                }else {
//                    self.lblpkg.isHidden =  true
//                    self.viewpackage.isHidden =  true
//                    self.btntop.priority =    UILayoutPriority(rawValue: 750)
//                }
//            } else {
//                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
//            }
//        }, Failure: {error in
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
//        })
//    }
    
    
    
//    @IBAction func childAction(_ sender: Any) {
//        ChildSubCategorydropDown.anchorView = btnChildCategory
//        ChildSubCategorydropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        ChildSubCategorydropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//        var ChildcategoryArray = [String]()
//        ChildcategoryArray = childCategoriesList.map({$0.child_subcategory_title_en!})
//
//        ChildSubCategorydropDown.dataSource = ChildcategoryArray
//
//        ChildSubCategorydropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//            print(index)
//            self.txtchildCategory.text = item
//            self.params.params.updateValue(self.childCategoriesList[index].child_categories_id! , forKey:"childcategory" )
//
//        }
//        ChildSubCategorydropDown.show()
//
//    }
    

    @IBAction func vendortypeAction(_ sender: UIButton) {
        
        
               VendorTypedropDown.anchorView = btnvendrotype
               VendorTypedropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
               VendorTypedropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

              

               VendorTypedropDown.dataSource = ["Manufacturer","Supplier","Wholesaler","Distributor","Producer","Service Provider"
               ,"Retailer"]

               VendorTypedropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                   print(index)
                   self.txtvendortype.text = item //+ "    -    " +  "Rs  " + self.pkglist[index].price!
                   self.params.params.updateValue(item, forKey:"vendor_type" )

               }
               VendorTypedropDown.show()
    }
    
    
    
    
//    @IBAction func pkgaction(_ sender: UIButton) {
//
//        PkgDown.anchorView = btnpkg
//        PkgDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        PkgDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//        var pkgArray = [String]()
//        pkgArray = pkglist.map({$0.package_name!})
//
//        PkgDown.dataSource = ["Free"]
//
//        PkgDown.selectionAction = { [unowned self] (index: Int, item: String) in
//            print(index)
//            self.txtpkg.text = item //+ "    -    " +  "Rs  " + self.pkglist[index].price!
//            self.params.params.updateValue("1", forKey:"package" )
//
//        }
//        PkgDown.show()
//    }
    
    
    
    
    
    
    
    
    @IBAction func nextAction(_ sender: UIButton) {
        if checkData(){
            moneOnProfile()
        }
        
    }

    func  checkData() -> Bool {
        
        if self.listOfFeature.count == 0 {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Select The Category", messagetype: 0)
            return false
        }
        else if txtmarket.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Select Feature List", messagetype: 0)
            return false
        }
//        else if txtpkg.text == "" {
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Select The Package", messagetype: 0)
//            return false
//        }
        else if txtvendortype.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Select The Vendor Type", messagetype: 0)
            return false
        }
        return true
    }
    
    
    
    func moneOnProfile() {
        self.params.params.updateValue("1", forKey:"package" )
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "BusinessInfoVC") as? BusinessInfoVC
            vc?.params = params
            vc?.fromMyaccount =  fromMyaccount
            vc?.editvendorsBProfile =  editvendorsBProfile
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "BusinessInfoVC") as? BusinessInfoVC
            vc?.params = params
              vc?.fromMyaccount =  fromMyaccount
            vc?.editvendorsBProfile =  editvendorsBProfile
        self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
    
    func deleteFeatureList(cell: VendortypeCell) {
        let indx = clView.indexPath(for: cell)
        self.listOfFeature.remove(at: indx!.row)
        self.params.features.remove(at: indx!.row)
        self.clView.reloadData()
    }
    
}
extension VendorPackageVC : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfFeature.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VendortypeCell", for: indexPath) as? VendortypeCell
        cell?.lbltitle.text =  listOfFeature[indexPath.row]
        cell?.delegate =  self
        return cell!
    }
    
    
}
