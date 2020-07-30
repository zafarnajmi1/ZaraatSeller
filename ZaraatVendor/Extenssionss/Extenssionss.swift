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
