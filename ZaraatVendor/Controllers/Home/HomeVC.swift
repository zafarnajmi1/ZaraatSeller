//
//  HomeVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  BadgeHub

class HomeVC: UIViewController {

    //@IBOutlet weak var ovelView: UIView!
    @IBOutlet weak var supportView: UIView!
    @IBOutlet weak var inboxView: UIView!
    @IBOutlet weak var salesView: UIView!
    @IBOutlet weak var myAccountView: UIView!
    
    @IBOutlet weak var inquiresView: UIView!
    
    @IBOutlet weak var ordersView: UIView!
    
      var notificationBadge : BadgeHub?
    
    @IBOutlet weak var btninquries: UIButton!
    @IBOutlet weak var btnorders: UIButton!
    let buttonBar = UIView()
    // This needs to be false since we are using auto layout constraints
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabs()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
         navigationController?.navigationBar.titleTextAttributes = textAttributes
       //navigationButtons()
         setNavigationBar()
         UIApplication.shared.setStatusBar()
        //self.navigationController?.navigationBar.isHidden =  true
        self.navigationItem.title = "Zaraat Seller"
        supportView.viewconfig(radius: 5)
         inboxView.viewconfig(radius: 5)
         myAccountView.viewconfig(radius: 5)
         salesView.viewconfig(radius: 5)
        //ovelView.roundCornersWithLayerMask(cornerRadii: 30, corners: [.bottomRight,.bottomLeft])
//        notificationBadge = BadgeHub(view: supportView)
//        notificationBadge?.scaleCircleSize(by: 0.65)
//        notificationBadge?.setCircleColor(#colorLiteral(red: 0.9568627451, green: 0.6352941176, blue: 0.2078431373, alpha: 1), label: nil)
//        notificationBadge?.setCount(1)
//
//        notificationBadge = BadgeHub(view: inboxView)
//        notificationBadge?.scaleCircleSize(by: 0.65)
//        notificationBadge?.setCircleColor(#colorLiteral(red: 0.9568627451, green: 0.6352941176, blue: 0.2078431373, alpha: 1), label: nil)
//        notificationBadge?.setCount(1)

        //segmentConfig()
    }
    
    func setTabs(){
        
       btninquries.layer.borderWidth =  1
       btninquries.layer.borderColor =  #colorLiteral(red: 0.7007732391, green: 0.7412289977, blue: 0.7496894598, alpha: 1)
       btninquries.roundButton()
       btninquries.setTitleColor(#colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1), for: .normal)
       
        btnorders.roundButton()
       btnorders.layer.backgroundColor =  #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
      btnorders.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
       
       ordersView.alpha =  1
       inquiresView.alpha = 0

    }
    
    @IBAction func inqueriesAction(_ sender: Any) {
        btnorders.layer.borderWidth =  1
               btnorders.layer.borderColor =  #colorLiteral(red: 0.7007732391, green: 0.7412289977, blue: 0.7496894598, alpha: 1)
               btnorders.roundButton()
               btnorders.setTitleColor(#colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1), for: .normal)
         btnorders.layer.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
         
        btninquries.roundButton()
        btninquries.layer.backgroundColor =  #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
        btninquries.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        ordersView.alpha =  0
        inquiresView.alpha = 1
    }
    
    @IBAction func orderAction(_ sender: UIButton) {
        
        btninquries.layer.borderWidth =  1
              btninquries.layer.borderColor =  #colorLiteral(red: 0.7007732391, green: 0.7412289977, blue: 0.7496894598, alpha: 1)
              btninquries.roundButton()
              btninquries.setTitleColor(#colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1), for: .normal)
         btninquries.layer.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
       btnorders.roundButton()
         btnorders.layer.backgroundColor =  #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
        btnorders.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        ordersView.alpha =  1
        inquiresView.alpha = 0

    }
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shadowImage = UIImage()
       // segment.removeBorders(andBackground: false)
        UIView.animate(withDuration: 0.2, animations: {
            self.tabBarController?.tabBar.isHidden = false
       })
    }
    
    
//    func segmentConfig() {
//
//        segment.backgroundColor = .white
//
//        buttonBar.translatesAutoresizingMaskIntoConstraints = false
//        buttonBar.backgroundColor = #colorLiteral(red: 0.1410522163, green: 0.3398962617, blue: 0.1778770983, alpha: 1)//UIColor.orange
//        view.addSubview(buttonBar)
//        buttonBar.topAnchor.constraint(equalTo: segment.bottomAnchor).isActive = true
//        buttonBar.heightAnchor.constraint(equalToConstant: 4).isActive = true
//        // Constrain the button bar to the left side of the segmented control
//        buttonBar.leftAnchor.constraint(equalTo: segment.leftAnchor).isActive = true
//        // Constrain the button bar to the width of the segmented control divided by the number of segments
//        buttonBar.widthAnchor.constraint(equalTo: segment.widthAnchor, multiplier: 1 / CGFloat(segment.numberOfSegments)).isActive = true
//
//
//
//
//
//
//    }
    
    
    @IBAction func SaleAction(_ sender: UIButton) {
        
        
        if ShareData.shareInfo.userInfo?.vendors?.status == 1 {
        if UIDevice.current.userInterfaceIdiom == .pad {
                   
               let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
               let vc =  storyBoard.instantiateViewController(withIdentifier: "TotalSalesVC") as? TotalSalesVC
                   //hidesBottomBarWhenPushed = true
               self.navigationController?.pushViewController(vc!, animated: true)
               
               } else {
               
               let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
               let vc =  storyBoard.instantiateViewController(withIdentifier: "TotalSalesVC") as? TotalSalesVC
                   //hidesBottomBarWhenPushed = true
               self.navigationController?.pushViewController(vc!, animated: true)
               }
        } else {
            alertMessage(message: "Please Fill The Business Profile", completionHandler: {
                self.moveOnBusinProfile()
            })
        }
    }
    
    
    func moveOnBusinProfile() {
           if UIDevice.current.userInterfaceIdiom == .pad {

                 let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                 let vc =  storyBoard.instantiateViewController(withIdentifier: "VendorPackageVC") as? VendorPackageVC
                  vc!.fromMyaccount =  true
               vc?.hidesBottomBarWhenPushed =  true
                 self.navigationController?.pushViewController(vc!, animated: true)

           } else {

                 let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                 let vc =  storyBoard.instantiateViewController(withIdentifier: "VendorPackageVC") as? VendorPackageVC
                  vc!.fromMyaccount =  true
               vc?.hidesBottomBarWhenPushed =  true
                 self.navigationController?.pushViewController(vc!, animated: true)
           }
           
       }
    
    
    @IBAction func myProductAction(_ sender: UIButton) {
        if ShareData.shareInfo.userInfo?.vendors?.status == 1 {
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "MyproductsVC") as? MyproductsVC
            //hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "MyproductsVC") as? MyproductsVC
            //hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc!, animated: true)
        }
        } else {
            alertMessage(message: "Please Fill The Business Profile", completionHandler: {
                self.moveOnBusinProfile()
            })
        }
    }
    
    
    
    @IBAction func inboxAction(_ sender: UIButton) {
          
        self.alertMessage(message: "Chat coming soon...", completionHandler: {
            
        })
//        if UIDevice.current.userInterfaceIdiom == .pad {
//
//        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
//        let vc =  storyBoard.instantiateViewController(withIdentifier: "ConversationVC") as? ConversationVC
//            //hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(vc!, animated: true)
//
//        } else {
//
//        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
//        let vc =  storyBoard.instantiateViewController(withIdentifier: "ConversationVC") as? ConversationVC
//            //hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(vc!, animated: true)
//        }
    }
    
    
    @IBAction func supportAction(_ sender: UIButton) {
        
//        self.alertMessage(message: "Order's Comining Soon...", completionHandler: {
//
//              })
//        NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
        if ShareData.shareInfo.userInfo?.vendors?.status == 1 {
        if UIDevice.current.userInterfaceIdiom == .pad {

        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "AllOrderVC") as? AllOrderVC
            //hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc!, animated: true)

        } else {

        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "AllOrderVC") as? AllOrderVC
            //hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc!, animated: true)
        }
        } else {
            alertMessage(message: "Please Fill The Business Profile", completionHandler: {
                self.moveOnBusinProfile()
            })
        }
    }
    
    
    
//    @IBAction func segmentAction(_ sender: UISegmentedControl) {
//
//
//        UIView.animate(withDuration: 0.3) {
//
//           self.buttonBar.frame.origin.x = (self.segment.frame.width / CGFloat(self.segment.numberOfSegments)) * CGFloat(self.segment.selectedSegmentIndex)
//      }
//
//
//
//
//
//       if  sender.selectedSegmentIndex == 0 {
//
//            self.firstView.alpha = 1
//            self.secondView.alpha = 0
//       } else {
//        self.firstView.alpha = 0
//        self.secondView.alpha = 1
//        }
//
//    }
    
    
    
//    private func animateSegmentedControl() {
//        UIView.animate(withDuration: 0.3) {
//            if let segment = self.segment {
//                self.buttonBar.frame.origin.x = (segment.frame.width / CGFloat(2)) * CGFloat(self.segment.numberOfSegments)
//            }
//        }
//    }
    
    
}
//extension UISegmentedControl {
//
//
//
//    func setSelectedSegmentColor(with foregroundColor: UIColor, and tintColor: UIColor) {
//    if #available(iOS 13.0, *) {
//    self.setTitleTextAttributes([.foregroundColor: foregroundColor], for: .selected)
//        self.selectedSegmentTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//    } else {
//        self.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        }}
//
//
//    func removeBorders(andBackground:Bool=false) {
//        setBackgroundImage(imageWithColor(color: backgroundColor ?? .clear), for: .normal, barMetrics: .default)
//        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
//        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
//
//        _ = self.subviews.compactMap {
//            if ($0.frame.width>0) {
//                $0.layer.cornerRadius = 8
//                $0.layer.borderColor = UIColor.clear.cgColor
//                $0.clipsToBounds = true
//                $0.layer.borderWidth = andBackground ? 1.0 : 0.0
//                $0.layer.borderColor = andBackground ? tintColor?.cgColor : UIColor.clear.cgColor
//                andBackground ? $0.layer.backgroundColor = UIColor.clear.cgColor : nil
//            }
//        }
//    }
//
//    // create a 1x1 image with this color
//    private func imageWithColor(color: UIColor) -> UIImage {
//        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
//        UIGraphicsBeginImageContext(rect.size)
//        let context = UIGraphicsGetCurrentContext()
//        context!.setFillColor(color.cgColor);
//        context!.fill(rect);
//        let image = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        return image!
//    }
//}
