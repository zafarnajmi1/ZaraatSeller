//
//  Extenssionss.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/27/20.
//  Copyright © 2020 User. All rights reserved.
//


import Foundation
import UIKit
import SDWebImage

extension UIViewController {
    
    
    
    
      public func setNavigationBar(){
            self.navigationItem.hidesBackButton =  false
            self.navigationController?.isNavigationBarHidden = false
             self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
             let navColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)//UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
             let color: UIColor = navColor
             self.navigationController?.navigationBar.isTranslucent = false
             self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) //UIColor(red: 223/255, green: 48/255, blue: 81/255, alpha: 1.0)
             self.navigationController?.navigationBar.barTintColor = color
            
    //        let navigationBar = navigationController?.navigationBar
    //        let navigationBarAppearence = UINavigationBarAppearance()
    //        //navBarAppearence.shadowColor = .clear
    //        navigationBar!.scrollEdgeAppearance = navigationBarAppearence
            
             //self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            // self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "JosefinSans-SemiBold", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.white]
             self.navigationController?.navigationBar.barStyle = .blackTranslucent
             
         }
    
    func navigationButtons() {

        let btn1 = UIButton()  //UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
          
         btn1.frame = CGRect(x: 0.0, y: 0.0, width: 10, height: 10)
        btn1.setImage(UIImage(named: "chat"), for: .normal) //setBackgroundImage(UIImage(named: "user (-1"), for: .normal)
        btn1.addTarget(self, action: #selector(btnEditprofilClick(_:)), for: .touchUpInside)
       
        let chat = UIBarButtonItem(customView: btn1)
        
        let btn2 = UIButton()  //UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
                 
                btn2.frame = CGRect(x: 0.0, y: 0.0, width: 10, height: 10)
               btn2.setImage(UIImage(named: "Orders"), for: .normal) //setBackgroundImage(UIImage(named: "user (-1"), for: .normal)
               btn2.addTarget(self, action: #selector(btnEditprofilClick(_:)), for: .touchUpInside)
              
               let order = UIBarButtonItem(customView: btn2)
        
        
        
         self.navigationItem.setRightBarButtonItems([chat, order], animated: true)
    }
    
    @objc func btnEditprofilClick(_ sender: Any){
                 
                
                 
             }
    
    func addNavigationButton()
       {
           let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
           btn1.setBackgroundImage(UIImage(named: "Cart"), for: .normal)
           
           btn1.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
           let btnmsg = UIBarButtonItem(customView: btn1)
           
        
        
        let btn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        btn2.setBackgroundImage(UIImage(named: "SignIn"), for: .normal)
        
        btn2.addTarget(self, action: #selector(btnLoginClick(_:)), for: .touchUpInside)
        let btnLogin = UIBarButtonItem(customView: btn2)
        self.navigationItem.setRightBarButtonItems([btnLogin,btnmsg], animated: true)
        
           
       }
       @objc func btnClick (_ sender: Any){
          
        print("From Naviagtion ")
//               let storyboard = UIStoryboard(name: "Main", bundle: nil)
//               let vc =  storyboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
//               self.navigationController?.pushViewController(vc, animated: true)
           
           
       }
    
    
     @objc func btnLoginClick (_ sender: Any){
              
            
                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
                  let vc =  storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                  vc.hidesBottomBarWhenPushed = true
                 self.navigationController?.pushViewController(vc, animated: true)
               
               
           }
    
    
    
    
   
    
    
    func hideBackButton() {
        navigationItem.hidesBackButton = true
    }
    
    func addBackButton(backImage: UIImage = #imageLiteral(resourceName: "backarrow")) {
        hideBackButton()
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem  = backButton
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        dismissVC(completion: nil)
        
    }
    
    open func dismissVC(completion: (() -> Void)? ) {
        dismiss(animated: true, completion: completion)
    }
    
    
    func alertMessage(message:String,completionHandler:(()->())?) {
        let alert = UIAlertController(title:"", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
            completionHandler?()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
}

extension UIView {
    
    
    func cardShadow(){
        self.layer.cornerRadius = 10.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.7
    }
    
    
    
    enum VerticalLocation: String {
        case bottom
        case top
    }
    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.3, radius: CGFloat = 50) {
            switch location {
            case .bottom:
                addShadow(offset: CGSize(width: 0, height: 5), color: color, opacity: opacity, radius: radius)
            case .top:
                addShadow(offset: CGSize(width: 0, height: -5), color: color, opacity: opacity, radius: radius)
            }
        }

        func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.3, radius: CGFloat = 50) {
            self.layer.masksToBounds = false
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOffset = offset
            self.layer.shadowOpacity = opacity
            self.layer.shadowRadius = radius
        }
    
    
    
    func dropShadow(shadowColor: UIColor = UIColor.black,
                    fillColor: UIColor = UIColor.white,
                    opacity: Float = 0.2,
                    offset: CGSize = CGSize(width: 0.0, height: 10.0),
                    radius: CGFloat = 1) -> CAShapeLayer {

        let shadowLayer = CAShapeLayer()

        shadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = offset
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = radius
        layer.insertSublayer(shadowLayer, at: 0)
        return shadowLayer
    }
    
    public func addSoftUIEffectForView(cornerRadius: CGFloat = 15.0, themeColor: UIColor = UIColor(red: 241/255, green: 243/255, blue: 246/255, alpha: 1.0)) {
        self.layer.cornerRadius = layer.frame.height / 2 //cornerRadius
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize( width: 2, height: 2)
        self.layer.shadowColor = UIColor(red: 223/255, green: 228/255, blue: 238/255, alpha: 1.0).cgColor
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.frame = bounds
        shadowLayer.backgroundColor = themeColor.cgColor
        shadowLayer.shadowColor = UIColor.white.cgColor
        shadowLayer.cornerRadius = cornerRadius
        shadowLayer.shadowOffset = CGSize(width: -2.0, height: -2.0)
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 2
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    
    
    //For Inner Shadow
    public func addInnerShadow(topColor: UIColor = UIColor.black.withAlphaComponent(1)) {
        layer.cornerRadius = layer.frame.height / 2
        layer.borderWidth = 0.5
        layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        layer.masksToBounds = true
        let shadowLayer = CAGradientLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.frame = bounds
        shadowLayer.frame.size.height = layer.frame.height//10.0
        shadowLayer.colors = [
            topColor.cgColor,
            UIColor.white.withAlphaComponent(0).cgColor
        ]
        layer.addSublayer(shadowLayer)
    }
    
    
    public func addInnerShadowForVerificationCode(topColor: UIColor = UIColor.black.withAlphaComponent(1)) {
        layer.cornerRadius =  10
        layer.borderWidth = 0.5
        layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        let shadowLayer = CAGradientLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.frame = bounds
        shadowLayer.frame.size.height = layer.frame.height//10.0
        shadowLayer.colors = [
            topColor.cgColor,
            UIColor.white.withAlphaComponent(0).cgColor
        ]
        layer.addSublayer(shadowLayer)
    }
    
    func  viewconfig(radius: Int) {
        self.layer.cornerRadius = CGFloat(radius)
    }
    func  viewSetUp(radius: Int, color: CGColor, borderwidth : Int = 0) {
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.borderColor = color
        self.layer.borderWidth = CGFloat(borderwidth)
    }
    
   func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    self.clipsToBounds = true

    let mask = CAShapeLayer()
         mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func roundCornersWithLayerMask(cornerRadii: CGFloat, corners: UIRectCorner) {
      let path = UIBezierPath(roundedRect: bounds,
                              byRoundingCorners: corners,
                              cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
      let maskLayer = CAShapeLayer()
      maskLayer.path = path.cgPath
      layer.mask = maskLayer
    }
    
    
    func round(_ corners: UIRectCorner, radius: CGFloat) {
           let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
      self.clipsToBounds = true

      let mask = CAShapeLayer()
           mask.path = path.cgPath
           self.layer.mask = mask
      }
    
    
    func roundView() {
        self.layer.cornerRadius = layer.frame.height / 2
    }
    func setroundCornerView(corner : Int) {
        self.layer.cornerRadius = CGFloat(corner)
    }
    
    func setroundCornerViewTimer(corner : Int) {
        self.layer.cornerRadius = CGFloat(corner)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.9563240409, green: 0.9725990891, blue: 0.9766971469, alpha: 1)
    }
    
    func roundcornerAndBorder(border: Int, color: CGColor, round: Int){
        self.layer.borderWidth = CGFloat(border)
        self.layer.borderColor = color
        self.layer.cornerRadius = CGFloat(round)
    }
    
    func roundcornerAndBorder1(border: Int, color: CGColor){
        self.layer.borderWidth = CGFloat(border)
        self.layer.borderColor = color
        self.layer.cornerRadius = layer.frame.height / 2
    }
    func roundViewAndBorder(border: Int, color: CGColor){
        self.layer.borderWidth = CGFloat(border)
        self.layer.borderColor = color
        self.layer.cornerRadius = layer.frame.height / 2
    }
    
    
    
    
    
    
    
    
}



extension UIImageView {
    func setimagConfig() {
        
    }
    
    func setroundCorner(corner : Int) {
        self.layer.cornerRadius = CGFloat(corner)
    }
    
    func roundCornersImage(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }
    func roundImg (){
        self.clipsToBounds = true
        self.layer.cornerRadius = layer.frame.height / 2
    }
    
    
}


extension UIButton {
    func roundbuttonRadius(borderwidth: Int){
        self.layer.cornerRadius = layer.frame.height / 2
        self.layer.borderWidth = CGFloat(borderwidth)
        self.layer.borderColor = #colorLiteral(red: 0.9294117647, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
    }
    func roundbuttonRadius1(borderwidth: Int){
        self.layer.cornerRadius = layer.frame.height / 2
        self.layer.borderWidth = CGFloat(borderwidth)
        self.layer.borderColor = #colorLiteral(red: 0.03137254902, green: 0.2980392157, blue: 0.09411764706, alpha: 1)
    }
    func roundButton(){
        self.layer.cornerRadius = layer.frame.height / 2
    }
    
}



extension String {
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    
    var isValidCode: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "^([0-9]{7}+[-]{1}+[0-9]{1})").evaluate(with: self)
    }
}


extension UITextField{
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
extension String {
    
    
    var html2AttributedString: NSAttributedString? {
           do {
               return try NSAttributedString(data: Data(utf8),
                                             options: [.documentType: NSAttributedString.DocumentType.html,
                                                       .characterEncoding: String.Encoding.utf8.rawValue],
                                             documentAttributes: nil)
           } catch {
               print("error: ", error)
               return nil
           }
       }
       var html2String: String {
           return html2AttributedString?.string ?? ""
       }
    
    
 
    
}



func formatedDatetype(string: String)-> String {
    
    let dateFormatter = DateFormatter()
    let tempLocale = dateFormatter.locale // save locale temporarily
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    let date = dateFormatter.date(from: string)!
    dateFormatter.dateFormat = "d MMM yyyy"//"dd-MM-yyyy"//"MMM d, yyyy" ; //"dd-MM-yyyy HH:mm:ss"
    dateFormatter.locale = tempLocale // reset the locale --> but no need here
    let dateString = dateFormatter.string(from: date)
        return dateString
    }

extension UIImageView {
    func roundImage(){
        self.layer.cornerRadius = self.layer.frame.height / 2
        
    }
    
    
   
        
        func setPath( string: String?,_ placeholder: String? )  {
            let url = URL(string: string ?? "")
            self.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.sd_setImage(with: url , placeholderImage: UIImage(named: placeholder ?? ""))
        }
    
    
}
extension UIViewController {
    func darkDisabled() {
          overrideUserInterfaceStyle = .light
    }
}





@IBDesignable class ShadowView: UIView {

    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }

    
    
    
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable var shadowOffset: CGPoint {
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }

     }

    @IBInspectable var shadowBlur: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue / 2.0
        }
    }

    
    @IBInspectable var borderwidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    @IBInspectable var borderColor: UIColor? {
           get {
               if let color = layer.borderColor {
                   return UIColor(cgColor: color)
               }
               return nil
           }
           set {
               if let color = newValue {
                   layer.borderColor = color.cgColor
               } else {
                   layer.borderColor = nil
               }
           }
       }
    
    
    @IBInspectable var shadowSpread: CGFloat = 0 {
        didSet {
            if shadowSpread == 0 {
                layer.shadowPath = nil
            } else {
                let dx = -shadowSpread
                let rect = bounds.insetBy(dx: dx, dy: dx)
                layer.shadowPath = UIBezierPath(rect: rect).cgPath
            }
        }
    }
}


extension UIApplication {
    

    var statusBarView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 38482458
            if let statusBar = self.keyWindow?.viewWithTag(tag) {
                return statusBar
            } else {
                let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
                statusBarView.tag = tag
                
                self.keyWindow?.addSubview(statusBarView)
                return statusBarView
            }
        } else {
            if responds(to: Selector(("statusBar"))) {
                return value(forKey: "statusBar") as? UIView
            }
        }
        return nil
    }
    
    func setStatusBar(color: UIColor = #colorLiteral(red: 0.06274239719, green: 0.2067543268, blue: 0.2775997818, alpha: 1)){
        let view = UIApplication.shared.statusBarView
        if let statusBarView = view  {
              statusBarView.backgroundColor = color
        }
    }
    
    
}
