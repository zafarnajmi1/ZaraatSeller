//
//  ManageProductVC.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ManageProductVC: UIViewController {
    @IBOutlet weak var btndelete: UIButton!
    
    @IBOutlet weak var lbldescription: UILabel!
    @IBOutlet weak var lblstock: UILabel!
    @IBOutlet weak var lblproductname: UILabel!
    @IBOutlet weak var addVeriation: UIView!
    
    @IBOutlet weak var addFeaturesView: UIView!
    @IBOutlet weak var addCoupanView: UIView!
    @IBOutlet weak var addSaleView: UIView!
    
    @IBOutlet weak var addDealView: UIView!
    
    //@IBOutlet weak var mainView: UIView!
    @IBOutlet weak var EditView: UIView!
    
    @IBOutlet weak var VariationsView: UIView!
    @IBOutlet weak var featureView: UIView!
    @IBOutlet weak var slidercollection: UICollectionView!
    @IBOutlet weak var pagercontrol: UIPageControl!
    var productId = 0
    var viewproduct: ViewProductsModel?
 
    override func viewDidLoad() {
        super.viewDidLoad()
         addBackButton()
        self.title = "Manage Product"
        self.slidercollection.register(UINib.init(nibName: "cellSlider", bundle: nil), forCellWithReuseIdentifier: "cellSlider")
        setUpManageProduct()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getViewPrpduct()
         setSlider()
    }
    
    
   
    func setSlider(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width:self.slidercollection.frame.width, height: self.slidercollection.frame.height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        self.slidercollection!.collectionViewLayout = layout
        Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
        
        
    }
    
    
    @objc func scrollAutomatically(_ timer: Timer) {
           
           if let coll  = self.slidercollection {
               for cell in coll.visibleCells {
                   let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)!  < (self.viewproduct?.gallery!.count)! - 1){
                       let indexPath1: IndexPath?
                       indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                       
                       coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                   }
                   else{
                       let indexPath1: IndexPath?
                       indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                       coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                   }
                   
               }
           }
       }
    
    
    
    
    func getViewPrpduct(){
        ShareData.showProgress()
        userhandler.viewVendorProduct(id: productId, Success: {successResponse in
            ShareData.hideProgress()
            if successResponse.status == 1 {
                self.viewproduct =  successResponse
                
                self.lblstock.text =  self.viewproduct?.product?.product_stock
                self.lbldescription.text =  self.viewproduct?.product?.product_description_en
                self.lblproductname.text =  self.viewproduct?.product?.product_title_en
                self.slidercollection.reloadData()
            } else {
                 ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: successResponse.message!, messagetype: 0)
            }
        }, Failure: {error in
             ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    func setUpManageProduct() {
        //mainView.viewSetUp(radius: 8, color: #colorLiteral(red: 0.7955924273, green: 0.8120230436, blue: 0.8036844134, alpha: 1), borderwidth: 1)
        EditView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//        previewView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//        featuresView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
//        galeeryView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        btndelete.roundButton()
        addVeriation.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        
        addFeaturesView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
       addCoupanView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
         addSaleView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        addDealView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        
        
         featureView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
         VariationsView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
    }

    @IBAction func featuresAction(_ sender: UIButton) {
        
        if self.viewproduct?.features?.feature_id == nil {
                   alertMessage(message: "There Are No Features Exist Please Add The Features") {
                       print("")
                   }
               } else {
               
               if UIDevice.current.userInterfaceIdiom == .pad {
                     
                     let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                     let vc =  storyBoard.instantiateViewController(withIdentifier: "FeaturesViewVC") as? FeaturesViewVC
                vc!.features =  self.viewproduct?.features
                     self.navigationController?.pushViewController(vc!, animated: true)

                     } else {

                     let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                     let vc =  storyBoard.instantiateViewController(withIdentifier: "FeaturesViewVC") as? FeaturesViewVC
                    vc!.features =  self.viewproduct?.features
                     self.navigationController?.pushViewController(vc!, animated: true)
                     }
               }
        
    }
    
    @IBAction func VariationAction(_ sender: UIButton) {
        
        if self.viewproduct?.variation?.variation_id == nil {
            alertMessage(message: "There Are No Variation Exist Please Add The Variation") {
                print("")
            }
        } else {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
              
              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "VariationListVC") as? VariationListVC
            vc?.variationid = (self.viewproduct?.variation?.variation_id)!
              self.navigationController?.pushViewController(vc!, animated: true)

              } else {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "VariationListVC") as? VariationListVC
            vc?.variationid = (self.viewproduct?.variation?.variation_id)!
              self.navigationController?.pushViewController(vc!, animated: true)
              }
        }
    }
    
    @IBAction func EditAction(_ sender: UIButton) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "AddProductVC") as? AddProductVC
            vc?.checktype =  true
            vc?.productid =  (viewproduct?.product?.products_id)!
        self.navigationController?.pushViewController(vc!, animated: true)

        } else {

        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "AddProductVC") as? AddProductVC
            vc?.checktype =  true
            vc?.productid =  (viewproduct?.product?.products_id)!
        self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        
    }
    
        
    @IBAction func addAction(_ sender: UIButton) {
        
        if self.viewproduct?.variation?.variation_id != nil {
            alertMessage(message: "There Are Already Variation Exist ") {
                print("")
            }
        } else {
        if UIDevice.current.userInterfaceIdiom == .pad {
              
              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "AddVeriationVC") as? AddVeriationVC
                    vc?.productid = (viewproduct?.product?.products_id)!
                   vc?.checktype = true
              self.navigationController?.pushViewController(vc!, animated: true)

              } else {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "AddVeriationVC") as? AddVeriationVC
                  vc?.productid = (viewproduct?.product?.products_id)!
               vc?.checktype = true
              self.navigationController?.pushViewController(vc!, animated: true)
              }
        }
    }
    
    @IBAction func addDealAction(_ sender: UIButton) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ViewDealsVC") as? ViewDealsVC
            
        self.navigationController?.pushViewController(vc!, animated: true)

        } else {

        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ViewDealsVC") as? ViewDealsVC
            
        self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    @IBAction func addSaleAction(_ sender: UIButton) {
        
        
        if UIDevice.current.userInterfaceIdiom == .pad {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "SalesListVC") as? SalesListVC
            vc?.productid = (viewproduct?.product?.products_id)!
        self.navigationController?.pushViewController(vc!, animated: true)

        } else {

        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "SalesListVC") as? SalesListVC
              vc?.productid = (viewproduct?.product?.products_id)!
        self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
    @IBAction func addCouponAction(_ sender: UIButton) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
               
               let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
               let vc =  storyBoard.instantiateViewController(withIdentifier: "CouponsListVC") as? CouponsListVC
                   
               self.navigationController?.pushViewController(vc!, animated: true)

               } else {

               let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
               let vc =  storyBoard.instantiateViewController(withIdentifier: "CouponsListVC") as? CouponsListVC
                   
               self.navigationController?.pushViewController(vc!, animated: true)
               }
        
    }
        
    @IBAction func addFeatureAction(_ sender: UIButton) {
        if self.viewproduct?.features?.feature_id != nil {
                          alertMessage(message: "There Are Already Features Exist ") {
                              print("")
                          }
                      } else {
                      
        if UIDevice.current.userInterfaceIdiom == .pad {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "AddFeaturesVC") as? AddFeaturesVC
            vc!.productid = (viewproduct?.product?.products_id)!
            vc?.checktype =  true
        self.navigationController?.pushViewController(vc!, animated: true)

        } else {

        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "AddFeaturesVC") as? AddFeaturesVC
            vc!.productid = (viewproduct?.product?.products_id)!
            vc?.checktype =  true
        self.navigationController?.pushViewController(vc!, animated: true)
        }
        }
    }
    
    
    
    @IBAction func deleteAction(_ sender: UIButton) {
        
        
        let alert = UIAlertController(title: "Alert", message: "Would you like to Delete This Sale", preferredStyle: UIAlertController.Style.alert)

                     
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {action in
            self.deleteProductApi()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

                     
                      self.present(alert, animated: true, completion: nil)
        
        
        
        
       
        
    }
    
    
    func deleteProductApi(){
        ShareData.showProgress()
               userhandler.deleteProduct(id:self.viewproduct?.product?.products_id ?? 0 , Success: { response in
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
    
    
    
    


extension ManageProductVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pagercontrol.numberOfPages = self.viewproduct?.gallery?.count ?? 0
        
        return self.pagercontrol.numberOfPages
        //        self.pagger.numberOfPages = appdelegate.sliderArray.count
        //        return self.pagger.numberOfPages
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.slidercollection.bounds.size.width, height:   self.slidercollection.bounds.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cellSlider", for: indexPath) as! cellSlider
       
        let model = (self.self.viewproduct?.gallery?[indexPath.row])!
        cell.setData(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pagercontrol.currentPage = indexPath.row
    }

}
