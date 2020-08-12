//
//  EditProfileVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DLRadioButton
class EditProfileVC: UIViewController {
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    @IBOutlet weak var userimg: UIImageView!
    
    @IBOutlet weak var txtname: UITextField!
    
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtphone: UITextField!
    
   // @IBOutlet weak var txtaddress: UITextField!
    
    @IBOutlet weak var btnmale: DLRadioButton!
    
    @IBOutlet weak var btnfemale: DLRadioButton!
    
    @IBOutlet weak var btnsave: UIButton!
    
    var docimg:UIImage?
    var docurl = ""
    var userprofile : UserProfileVendors?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Profile"
        btnsave.roundButton()
        addBackButton()
        userimg.roundImg()
        setEditProfile()
    }
    
    
    func setEditProfile() {
        self.txtname.text = userprofile?.owners_name
        self.txtemail.text =  userprofile?.email
        self.txtphone.text =  userprofile?.phone
        self.userimg.setPath(string: userprofile?.logo , "name")
        
        
    }

    @IBAction func imgEditAction(_ sender: UIButton) {
        self.PickImag()
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        
        var dic : [String: Any] = ["owners_name":txtname.text!,
                                   "email":txtemail.text!,
                                   "password":userprofile?.password! ?? "",
                                   "phone":txtphone.text!]
        if docurl != "" {
            dic.updateValue(docurl, forKey: "logo")
        } else {
            dic.updateValue(userprofile?.logo! ?? "", forKey: "logo")
        }
        
        print("parasm Updated", dic)
        ShareData.showProgress()
        
        userhandler.userprofileUpdate(parms: dic, Success: {responsesuess in
             ShareData.hideProgress()
            if responsesuess.success == 1 {
                self.userprofile =  responsesuess.vendors
                Zalert.ZshareAlert.showAlert(title: "Alert", message: responsesuess.message!, messagetype: 1)
                self.navigationController?.popViewController(animated: true)
            } else {
                ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: responsesuess.message!, messagetype: 0)
            }
        }, Failure: {error  in
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    func PickImag()
    {
        let alert = UIAlertController(title: "Please Select an Option", message: "", preferredStyle: .actionSheet)
        
        let Gallry = UIAlertAction(title: "Photo Library", style: .default){ (Picimg) in self.GalleryPic()
        }
        let camraimg = UIAlertAction(title: "Camera", style: .default){ (ac) in self.cemeraPic()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){(action) in self.cancel()
            
        }
        
        alert.addAction(Gallry)
        alert.addAction(camraimg)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    func cancel()
    {
        self.galleryimage.dismiss(animated: true, completion: nil)
    }
    
    func cemeraPic()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            cemeraimg.sourceType = .camera
            cemeraimg.delegate = self
            cemeraimg.allowsEditing = false
            present(cemeraimg, animated: true, completion: nil)
        }
        else {
            
            let alert = UIAlertController(title: "Camera", message: "Camera is not available", preferredStyle: .actionSheet)
            let alertaction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(alertaction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    func GalleryPic()
    {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        {
            galleryimage.delegate = self
            galleryimage.allowsEditing = false
            galleryimage.sourceType = UIImagePickerController.SourceType.photoLibrary
            present(galleryimage, animated: true, completion: nil)
            
        }else{
            
            print("Image is not Available")
            
        }
        
    }
    
}
extension EditProfileVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        self.docimg = img
        self.userimg.image =  img
        uploaddocApi(img:img)
        dismiss(animated: true, completion: nil)
    }
    
    
    func uploaddocApi(img:UIImage?) {
        ShareData.showProgress()
        userhandler.UploadDocument(img: img!, Success: {response in
            ShareData.hideProgress()
            self.docurl = response.path ?? ""
            
        }, Failure: {error in
            
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }

}
