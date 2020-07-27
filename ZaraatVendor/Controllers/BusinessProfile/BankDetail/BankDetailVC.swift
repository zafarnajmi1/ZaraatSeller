//
//  BankDetailVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/19/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DropDown
class BankDetailVC: UIViewController {

    @IBOutlet weak var businessInfoView: UIView!
    
    @IBOutlet weak var billingView: UIView!
    @IBOutlet weak var bankView: UIView!
    @IBOutlet weak var img: UIImageView!
   
    @IBOutlet weak var AccountTileView: UIView!
    
    @IBOutlet weak var accountNumberView: UIView!
    
    @IBOutlet weak var brancView: UIView!
    
    @IBOutlet weak var branchCodeView: UIView!
    
    //@IBOutlet weak var ibanView: UIView!
    
    @IBOutlet weak var btnNext: UIButton!
    
    
    @IBOutlet weak var txtAccounttitle: UITextField!
    
    @IBOutlet weak var txtaccount: UITextField!
    
    @IBOutlet weak var txtbranchname: UITextField!
    
    @IBOutlet weak var txtbranchCode: UITextField!
    
   // @IBOutlet weak var txtxiban: UITextField!
    
    @IBOutlet weak var btnbank: UIButton!
     var bankList = [Banks]()
     var bankDown = DropDown()
    var params = PostParams()
    var  editvendorsBProfile : EditBusinessProfileVendors?
     var fromMyaccount = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Business Profile"
        BankNameListApi()
     setUpView()
        addBackButton()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if fromMyaccount ==  true {
            addBackButton()
            self.navigationController?.navigationBar.isHidden =  false
            setUpEditProfile()
        }
    }
    
    func setUpEditProfile(){
    
        //txtxiban.text = editvendorsBProfile.ba
        txtaccount.text = editvendorsBProfile?.vendor_account_number
        txtbranchCode.text =  editvendorsBProfile?.vendor_branch_code
        txtAccounttitle.text =  editvendorsBProfile?.vendor_account_title
        txtbranchname.text = editvendorsBProfile?.vendor_bank_name
        self.params.params.updateValue(editvendorsBProfile?.bank_id ?? "", forKey:"bank_id" )
    }
    func setUpView() {
        
        
        
        billingView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.1410522163, green: 0.3398962617, blue: 0.1778770983, alpha: 1), borderwidth: 1)
        bankView.viewconfig(radius: 5)
        businessInfoView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.1410522163, green: 0.3398962617, blue: 0.1778770983, alpha: 1), borderwidth: 1)
        
        
        
        AccountTileView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
           
            accountNumberView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
           
          brancView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
           
           branchCodeView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
           
            //ibanView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
           
            //btnNext.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
        
        btnNext.roundbuttonRadius(borderwidth: 2)
       
    }

    
    
    @IBAction func btnnextAction(_ sender: UIButton) {
        if checkdata() {
            
            params.params.updateValue(txtbranchCode.text!, forKey: "vendor_branch_code")
           // params.params.updateValue(txtbranchname.text!, forKey: "vendor_bank_name")
            params.params.updateValue(txtaccount.text!, forKey: "vendor_account_number")
            params.params.updateValue(txtAccounttitle.text!, forKey: "vendor_account_title")
            
            
            params.params.updateValue("1", forKey: "bank_status")
           moveOnAdderess()
        }
    }
    
    func moveOnAdderess() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "BillingInfoVC") as? BillingInfoVC
            vc?.params = params
             vc?.fromMyaccount =  fromMyaccount
            vc?.editvendorsBProfile =  editvendorsBProfile
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "BillingInfoVC") as? BillingInfoVC
            vc?.params = params
             vc?.fromMyaccount =  fromMyaccount
            vc?.editvendorsBProfile =  editvendorsBProfile
        self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
    
    
    
    func checkdata() -> Bool {
        if txtAccounttitle.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Account Title (e.g john doe) ", messagetype: 0)
            return false
        } else if txtaccount.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Account Number (e.g 4242 424242 4242) ", messagetype: 0)
            return false
        }else if txtbranchname.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Branch Name (e.g HBL) ", messagetype: 0)
            return false
        }else if txtbranchCode.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Branch Code (e.g 2421) ", messagetype: 0)
            return false
        }
        return  true
    }
    
    
    @IBAction func BanlListAction(_ sender: UIButton) {
        bankDown.anchorView = btnbank
        bankDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        bankDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        var bankArray = [String]()
        bankArray = bankList.map({$0.bank_name!})

        bankDown.dataSource = bankArray

        bankDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print(index)
            self.txtbranchname.text = "  " + item
            //self.params.params.updateValue(self.bankList[index].bank_id!, forKey:"vendor_bank_name" )
             self.params.params.updateValue(self.bankList[index].bank_id!, forKey:"bank_id" )
            //bank_id
        }
        bankDown.show()
    }
    
    
    func BankNameListApi(){
        userhandler.getBanksList(Success: {response in
            if response.success == 1  {
                self.bankList = response.banks ?? []
            } else {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            Zalert.ZshareAlert.showAlert(title: "Alert", message:  error.message, messagetype: 0)
        }
        )
    }

    
    @IBAction func skipAction(_ sender: UIButton) {
        moveOnAdderess()
    }
    
    
//    func moveOnAdderess1() {
//        if UIDevice.current.userInterfaceIdiom == .pad {
//
//        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
//        let vc =  storyBoard.instantiateViewController(withIdentifier: "BillingInfoVC") as? BillingInfoVC
//
//        self.navigationController?.pushViewController(vc!, animated: true)
//
//        } else {
//
//        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
//        let vc =  storyBoard.instantiateViewController(withIdentifier: "BillingInfoVC") as? BillingInfoVC
//
//        self.navigationController?.pushViewController(vc!, animated: true)
//        }
//    }
}
