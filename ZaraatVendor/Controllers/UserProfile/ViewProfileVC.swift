//
//  ViewProfileVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewProfileVC: UIViewController {

    @IBOutlet weak var userimg: UIImageView!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    
    //@IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var btnedit: UIButton!
    var userprofile : UserProfileVendors?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
         btnedit.roundButton()
        addBackButton()
        userimg.roundImg()
        getUserProfile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setProfile()
    }
    
    func getUserProfile() {
        ShareData.showProgress()
        userhandler.userprofile(Success: {successResponse in
            ShareData.hideProgress()
            if successResponse.success == 1 {
                self.userprofile = successResponse.vendors
                self.phone.text =  successResponse.vendors?.phone
                self.email.text = successResponse.vendors?.email
                self.name.text =  successResponse.vendors?.owners_name
                self.userimg.setPath(string: successResponse.vendors?.logo , "name")
            } else {
                ShareData.hideProgress()
            }
        }, Failure: {error in
            ShareData.hideProgress()
        })
    }

    
    func setProfile() {
        
        self.phone.text =  self.userprofile?.phone
        self.email.text = self.userprofile?.email
        self.name.text =  self.userprofile?.owners_name
        self.userimg.setPath(string: self.userprofile?.logo , "name")
    }
    @IBAction func editAction(_ sender: UIButton) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "EditProfileVC") as? EditProfileVC
            vc!.userprofile =  userprofile
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "EditProfileVC") as? EditProfileVC
            vc!.userprofile =  userprofile
        self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    

}
