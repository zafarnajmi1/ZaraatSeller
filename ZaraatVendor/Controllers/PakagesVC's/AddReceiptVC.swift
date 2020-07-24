//
//  AddReceiptVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/20/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class AddReceiptVC: UIViewController {

    @IBOutlet weak var atttachView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txtreceipt: UITextField!
    
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var mainImgView: UIView!
    
    @IBOutlet weak var btncreate: UIButton!
    @IBOutlet weak var txtdescription: UITextView!
    
    
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    
    var docurl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Add Receipt"
        self.addBackButton()
        btncreate.roundButton()
        
        txtdescription.delegate = self
                txtdescription.textColor = UIColor.lightGray
                txtdescription.text = "Description"
               txtdescription.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
        
        descriptionView.layer.cornerRadius = 10
               descriptionView.layer.borderWidth = 1
               descriptionView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
    }
    
    @IBAction func attatchAction(_ sender: UIButton) {
        
        PickImag()
    }
    
    
    
    func checkData() -> Bool {
        if txtreceipt.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Select Receipt", messagetype: 0)
            return false
        }
        if txtdescription.text == "" {
                   Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter the Description", messagetype: 0)
                   return false
               }
        return true
    }
    
    

    @IBAction func createAction(_ sender: UIButton) {
        if checkData() {
            confirmPkgApi()
        }
        
    }
    
    
    func confirmPkgApi(){
        let dic : [String:Any] =  ["description":txtdescription.text!,"vendor_id":ShareData.shareInfo.userInfo?.vendors?.vendor_id! ?? 0, "package_id": ShareData.shareInfo.pkg?.package_id! ?? 0, "picture": self.docurl]
        ShareData.showProgress()
        userhandler.confirmPakg(params: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
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
extension AddReceiptVC: UITextViewDelegate{


func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.text == "Description" {
        textView.text = ""
        textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
        
    }
   
    
  
    
}

func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if text == "\n" {
        textView.resignFirstResponder()
    }
    return true
}

func textViewDidEndEditing(_ textView: UITextView) {
    if textView == txtdescription {
        if textView.text == ""{
        textView.text = "Description"
        textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
        
        }
    }
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
extension AddReceiptVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let imge =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        img.image =  imge
        mainImgView.isHidden =  false
        uploadReceiptdocApi(img:imge)
        dismiss(animated: true, completion: nil)
    }
    
//
    func uploadReceiptdocApi(img:UIImage?) {
        ShareData.showProgress()
        userhandler.addReceipt(img: img!, Success: {response in
            ShareData.hideProgress()
            self.docurl = response.picture ?? ""
            self.txtreceipt.text = "Receipt Has Uploaded"
        }, Failure: {error in

            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }

}

