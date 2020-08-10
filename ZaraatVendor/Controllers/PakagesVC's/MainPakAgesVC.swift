//
//  MainPakAgesVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
class MainPakAgesVC: ButtonBarPagerTabStripViewController {
    var packages :  [Packages]?
    override func viewDidLoad() {
        
      
             self.navigationController?.navigationBar.isTranslucent =  false
                settings.style.selectedBarHeight = 0 //line
                settings.style.buttonBarMinimumLineSpacing = 10
                settings.style.buttonBarItemsShouldFillAvailableWidth = true
                settings.style.buttonBarLeftContentInset = 0
                settings.style.buttonBarRightContentInset = 0
                settings.style.buttonBarMinimumInteritemSpacing = 0
                settings.style.selectedBarBackgroundColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
                 settings.style.selectedBarHeight  = 4
                settings.style.selectedBarVerticalAlignment = .bottom

                changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
                    guard changeCurrentIndex == true else { return }
                    oldCell?.label.textColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
                    oldCell?.contentView.backgroundColor = #colorLiteral(red: 0.9958658814, green: 1, blue: 0.9999271035, alpha: 1)
                    oldCell?.label.font = UIFont.init(name: "Poppins-Bold", size: 16)
                    newCell?.label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    newCell?.contentView.backgroundColor =  #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
                    newCell?.label.font = UIFont.init(name: "Poppins-Bold", size: 16)
       
    }
        
        super.viewDidLoad()
                   addBackButton()
                    self.title = "Packages"
                  
    
//    if let layout = buttonBarView.collectionViewLayout as? UICollectionViewFlowLayout {
//          layout.minimumLineSpacing = 0
//          layout.minimumInteritemSpacing = 10
//          buttonBarView.collectionViewLayout = layout
//
//          }
    
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.getpkgsapi()
//    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
             
         
         if UIDevice.current.userInterfaceIdiom == .pad {
             
      let child_1 = UIStoryboard(name: ShareData.shareInfo.Ipad, bundle: nil).instantiateViewController(withIdentifier: "FreePkgVC") as? FreePkgVC
           // child_1?.packages =  packages
            
            let child_2 = UIStoryboard(name: ShareData.shareInfo.Ipad, bundle: nil).instantiateViewController(withIdentifier: "SilverPkgVC") as? SilverPkgVC
            //child_2?.packages =  packages
            let child_3 = UIStoryboard(name: ShareData.shareInfo.Ipad, bundle: nil).instantiateViewController(withIdentifier: "GoldPkgVC")  as? GoldPkgVC
            //child_3?.packages =  packages
            let child_4 = UIStoryboard(name: ShareData.shareInfo.Ipad, bundle: nil).instantiateViewController(withIdentifier: "PlatinumPkgVC") as? PlatinumPkgVC
            //child_4?.packages =  packages
            let child_5 = UIStoryboard(name: ShareData.shareInfo.Ipad, bundle: nil).instantiateViewController(withIdentifier: "DiamondPkgVC")  as? DiamondPkgVC
            //child_5?.packages =  packages
            let child_6 = UIStoryboard(name: ShareData.shareInfo.Ipad, bundle: nil).instantiateViewController(withIdentifier: "TitaniumPkgVC") as? TitaniumPkgVC
            //child_6?.packages =  packages
          
            return [child_1!, child_2!,child_3!, child_4!,child_5!,child_6!]
         } else {
             
             
              let child_1 = UIStoryboard(name: ShareData.shareInfo.Iphone, bundle: nil).instantiateViewController(withIdentifier: "FreePkgVC") as? FreePkgVC
                         //child_1?.packages =  packages
            
                         let child_2 = UIStoryboard(name: ShareData.shareInfo.Iphone, bundle: nil).instantiateViewController(withIdentifier: "SilverPkgVC") as? SilverPkgVC
           // child_2?.packages =  packages
                         let child_3 = UIStoryboard(name: ShareData.shareInfo.Iphone, bundle: nil).instantiateViewController(withIdentifier: "GoldPkgVC")  as? GoldPkgVC
           // child_3?.packages =  packages
                         let child_4 = UIStoryboard(name: ShareData.shareInfo.Iphone, bundle: nil).instantiateViewController(withIdentifier: "PlatinumPkgVC") as? PlatinumPkgVC
           // child_4?.packages =  packages
                         let child_5 = UIStoryboard(name: ShareData.shareInfo.Iphone, bundle: nil).instantiateViewController(withIdentifier: "DiamondPkgVC")  as? DiamondPkgVC
            //child_5?.packages =  packages
                         let child_6 = UIStoryboard(name: ShareData.shareInfo.Iphone, bundle: nil).instantiateViewController(withIdentifier: "TitaniumPkgVC") as? TitaniumPkgVC
           // child_6?.packages =  packages
                       
                         return [child_1!, child_2!,child_3!, child_4!,child_5!,child_6!]
         }
        }
  
    
    func  getpkgsapi(){
        ShareData.showProgress()
        userhandler.getPkgs(Success: {response in
              ShareData.hideProgress()
            if response.success == 1 {
                self.packages = response.packages ?? []
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
