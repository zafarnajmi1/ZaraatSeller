//
//  HomeContainerVc.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 31/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
class HomeContainerVc: ButtonBarPagerTabStripViewController {

     override func viewDidLoad() {
               
           self.navigationController?.navigationBar.isTranslucent =  false
               settings.style.selectedBarHeight = 0 //line
               settings.style.buttonBarMinimumLineSpacing = 0
               settings.style.buttonBarItemsShouldFillAvailableWidth = true
               settings.style.buttonBarLeftContentInset = 0
               settings.style.buttonBarRightContentInset = 0
               settings.style.selectedBarBackgroundColor = #colorLiteral(red: 1, green: 0.518507421, blue: 0.0850796476, alpha: 1)
               settings.style.buttonBarMinimumInteritemSpacing = 0
                settings.style.selectedBarHeight  = 3
               //settings.style.selectedBarVerticalAlignment = .middle
               
               changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
                   guard changeCurrentIndex == true else { return }
                   oldCell?.label.textColor = #colorLiteral(red: 1, green: 0.518507421, blue: 0.0850796476, alpha: 1)
                   oldCell?.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                   oldCell?.label.font = UIFont.init(name: "Poppins-Medium", size: 18)
                   newCell?.label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                   newCell?.contentView.backgroundColor =  #colorLiteral(red: 1, green: 0.518507421, blue: 0.0850796476, alpha: 1)
                   newCell?.label.font = UIFont.init(name: "Poppins-Medium", size: 18)
       //            if self.isfromorder ==  true{
       //
       //                self.moveToViewController(at: 2)
       //            }
                   
               }

               
               
               super.viewDidLoad()
               addBackButton()
           self.title = "Sale"
           UIView.animate(withDuration: 0.1, animations: {
               self.tabBarController?.tabBar.isHidden = true
           })
           }
           
           
           override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
                
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                
        
               let child_1 = UIStoryboard(name: ShareData.shareInfo.Ipad, bundle: nil).instantiateViewController(withIdentifier: "OrderVC") as? OrderVC
               let child_2 = UIStoryboard(name: ShareData.shareInfo.Ipad, bundle: nil).instantiateViewController(withIdentifier: "InquiresVC")  as? InquiresVC
               
               return [child_1!, child_2!]
            } else {
                
                
                
                   let child_1 = UIStoryboard(name: ShareData.shareInfo.Iphone, bundle: nil).instantiateViewController(withIdentifier: "OrderVC") as? OrderVC
                   let child_2 = UIStoryboard(name: ShareData.shareInfo.Iphone, bundle: nil).instantiateViewController(withIdentifier: "InquiresVC")  as? InquiresVC
                   
                   return [child_1!, child_2!]
            }
           }
           

           

       }
