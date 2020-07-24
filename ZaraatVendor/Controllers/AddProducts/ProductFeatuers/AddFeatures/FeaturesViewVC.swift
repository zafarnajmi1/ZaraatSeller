//
//  FeaturesViewVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/16/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class FeaturesViewVC: UIViewController {
    
    
    @IBOutlet weak var lbltitleEn: UILabel!
    @IBOutlet weak var editView: UIView!
    
    @IBOutlet weak var deleteView: UIView!
    
    @IBOutlet weak var lbltitleurdu: UILabel!
    @IBOutlet weak var lbldescriptionEn: UILabel!
    
    @IBOutlet weak var lbldescriptionurdu: UILabel!
    var featuresid = 0
    
    var features : Features?
    override func viewDidLoad() {
        super.viewDidLoad()
        editView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        deleteView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        self.title = "View Features"
        addBackButton()
        setupOfFeatures()
    }
    
    
    func setupOfFeatures() {
        self.featuresid =  (features?.feature_id)!
        self.lbltitleEn.text = "Feature Title(en)   : " +  (features?.feature_title_en)!
        self.lbltitleurdu.text  =  "Feature Title(urdu)  : " + (features?.feature_title_urdu)!
        self.lbldescriptionEn.text =    (features?.feature_desc_en)!
        self.lbldescriptionurdu.text =  (features?.feature_desc_urdu)!
    }

    @IBAction func editAction(_ sender: UIButton) {
        
        
        if UIDevice.current.userInterfaceIdiom == .pad {
              
              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "AddFeaturesVC") as? AddFeaturesVC
                  vc?.features =  features
            vc?.checktype =  false
              self.navigationController?.pushViewController(vc!, animated: true)

              } else {

              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "AddFeaturesVC") as? AddFeaturesVC
            vc?.features =  features
            vc?.checktype =  false
              self.navigationController?.pushViewController(vc!, animated: true)
              }
        
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        
         let alert = UIAlertController(title: "Alert", message: "Would you like to Delete This Features", preferredStyle: UIAlertController.Style.alert)

                         
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {action in
                self.deleteFeatures()
            }))
                          alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

                         
                          self.present(alert, animated: true, completion: nil)
            
            
            
         
        }
        
        
        
        
        func deleteFeatures(){
            let dic : [String:Any] = ["feature_id": self.featuresid]
                 
                        userhandler.deleteFeatures(params: dic, Success: {response in
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
