//
//  InquiriesReplyVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 8/6/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class InquiriesReplyVC: UIViewController {
    var enquiresDetail : Enquiries?
    @IBOutlet weak var btnreply: UIButton!
    @IBOutlet weak var txtmessage: UITextView!
    @IBOutlet weak var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.layer.cornerRadius =  8
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        txtmessage.backgroundColor =  #colorLiteral(red: 0.9291937947, green: 0.9333343506, blue: 0.9373497367, alpha: 1)
        txtmessage.layer.cornerRadius = 5
        txtmessage.layer.borderWidth = 0.5
        txtmessage.layer.borderColor = #colorLiteral(red: 0.8780193925, green: 0.8902988434, blue: 0.8902269006, alpha: 1)
        txtmessage.delegate = self
         txtmessage.textColor = UIColor.lightGray
         txtmessage.text = "Reply"
        txtmessage.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
        btnreply.roundButton()
        
        //self.txtmessage.text =  enquiresDetail?.message
    }
    

    func replyenquires() {
        ShareData.showProgress()
        let dic : [String:Any] = ["reply": txtmessage.text!]
        userhandler.enquiriesReply(id: (enquiresDetail?.enquiry_id)!, params: dic, Success: {response in
            ShareData.hideProgress()

            if response.success == 1 {
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            } else {
                self.alertMessage(message: response.message ?? "", completionHandler: {})
                ShareData.hideProgress()
            }
        }, Failure: {error in
            self.alertMessage(message: error.message, completionHandler: {})
                           ShareData.hideProgress()
        })
    }
    
    
    
    
    
    @IBAction func replyAction(_ sender: UIButton) {
        if txtmessage.text == "" {
            
        } else {
            replyenquires()
        }
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
extension InquiriesReplyVC: UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Reply" {
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
        if textView == txtmessage {
            if textView.text == ""{
            textView.text = "Reply"
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            
            }
        }
        
        
        
    }
    
    
    
    
    
    
}
