//
//  HomeVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

   override func viewDidLoad() {
            super.viewDidLoad()
             //self.title = "Home"
            self.navigationController?.navigationBar.isHidden =  true
    //         self.navigationItem.hidesBackButton = false
          cinfigTabbar()
    
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = textAttributes
          
            setNavigationBar()
            UIApplication.shared.setStatusBar()
            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            //self.navigationController?.navigationBar.isHidden =  false
             self.navigationItem.hidesBackButton = true
            
        }
        
        
        
        
        func cinfigTabbar() {
            
//            tabBar.barTintColor = .white
//              tabBar.isTranslucent = false
//
//            tabBar.addShadow(location: .top)
//
//                    tabBar.layer.masksToBounds = false
//                    tabBar.isTranslucent = true
//                    tabBar.barStyle = .blackOpaque
//                    tabBar.layer.cornerRadius = 13
                    //tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
           tabBar.roundCorners([.topLeft, .topRight], radius: 100)
            let tabBar = self.tabBar
            tabBar.backgroundColor =  #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
            tabBar.clipsToBounds = true
            tabBar.layer.masksToBounds = true
            self.tabBar.isTranslucent = true
            tabBar.barTintColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
//            tabBar.backgroundImage = UIImage()
//
//            let bgView: UIImageView = UIImageView(image:UIImage.init(named: "Lower Curve"))
//            bgView.frame = tabBar.bounds
//            tabBar.addSubview(bgView)
//           tabBar.layer.borderWidth = 0
//            tabBar.layer.borderColor = .none
//            UITabBar.appearance().barTintColor = UIColor.clear
//
//            UITabBar.appearance().layer.borderWidth = 0.50
//            UITabBar.appearance().clipsToBounds = true
    //        self.tabBar.isTranslucent = false
    //        tabBar.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    //        tabBar.layer.shadowOpacity = 1
    //        tabBar.layer.shadowOffset = CGSize.zero
    //        tabBar.layer.shadowRadius = 5
    //        self.tabBar.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)//UIColor.clear.cgColor
    //        self.tabBar.layer.borderWidth = 1
    //        self.tabBar.clipsToBounds = false
    //        self.tabBar.backgroundColor = #colorLiteral(red: 0.8664550781, green: 0.8705855608, blue: 0.8746117353, alpha: 1)//UIColor.white
    //        UITabBar.appearance().shadowImage = UIImage()
    //        UITabBar.appearance().backgroundImage = UIImage()
            
    //       let fontAttributes = [NSAttributedString.Key.font: UIFont(name: "YourFontName", size: 12.0)!]
            //UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
          
            let selectedtxtcolor = #colorLiteral(red: 0.1764705882, green: 0.8352941176, blue: 0.9764705882, alpha: 1)
            let unSelectedtxtcolor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            UITabBar.appearance().tintColor =  #colorLiteral(red: 0.8582944274, green: 0.8745539188, blue: 0.8786686063, alpha: 1)
           
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unSelectedtxtcolor], for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedtxtcolor  ], for: .selected)
            
            
    //
    //                 let tabBarController =  UITabBarController()
    //
    //                        let tabGradientView = UIView(frame: tabBarController.tabBar.bounds)
    //                        tabGradientView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)//UIColor.white
    //                        tabGradientView.translatesAutoresizingMaskIntoConstraints = false;
    //
    //
    //                        tabBarController.tabBar.addSubview(tabGradientView)
    //                 tabBarController.tabBar.sendSubviewToBack(tabGradientView)
    //                        tabGradientView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    //
    //                        tabGradientView.layer.shadowOffset = CGSize(width: 0, height: 0)
    //                        tabGradientView.layer.shadowRadius = 4.0
    //                        tabGradientView.layer.shadowColor = UIColor.gray.cgColor
    //                        tabGradientView.layer.shadowOpacity = 0.6
    //                        tabBarController.tabBar.clipsToBounds = true
    //                        tabBarController.tabBar.backgroundImage = UIImage()
    //                        tabBarController.tabBar.shadowImage = UIImage()
                        
            
           
            
            
            
            
            
        }

       

    }
