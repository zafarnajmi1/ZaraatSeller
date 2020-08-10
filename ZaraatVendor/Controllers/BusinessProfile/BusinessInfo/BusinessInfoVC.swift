//
//  BusinessInfoVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 3/19/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import DropDown
import  GooglePlaces
import  GooglePlacePicker
class BusinessInfoVC: UIViewController {
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    @IBOutlet weak var billingView: UIView!
    @IBOutlet weak var bankView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var businessInfoView: UIView!
    
    @IBOutlet weak var btnNext: UIButton!
    
    //@IBOutlet weak var ownerNameView: UIView!
    @IBOutlet weak var companyNameView: UIView!
    @IBOutlet weak var businesstypeView: UIView!
    
    @IBOutlet weak var legalNameView: UIView!
    @IBOutlet weak var businessRegistrationView: UIView!
    @IBOutlet weak var attachmentView: UIView!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var phoneNumberView: UIView!
    
//    @IBOutlet weak var CountryView: UIView!
//
//    @IBOutlet weak var StateView: UIView!
    
//    @IBOutlet weak var citView: UIView!
//    @IBOutlet weak var zipView: UIView!
    @IBOutlet weak var addressView: UIView!
    //@IBOutlet weak var packageView: UIView!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var answerView: UIView!
    var logo =  false
    var params = PostParams()
    var fromMyaccount = false
    
   // @IBOutlet weak var txtownerName: UITextField!
    
    @IBOutlet weak var txtcompanyName: UITextField!
    
    @IBOutlet weak var txtbusinessType: UITextField!
    
    @IBOutlet weak var btnbusinesstype: UIButton!
    
    @IBOutlet weak var txtlegalName: UITextField!
    
    @IBOutlet weak var txtbusinessNumber: UITextField!
    
    @IBOutlet weak var txtDocumentAttachment: UITextField!
    
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtphone: UITextField!
    
//    @IBOutlet weak var btncountry: UIButton!
//
//
//    @IBOutlet weak var txtcountry: UITextField!
//
//
//    @IBOutlet weak var btnstate: UIButton!
    
    
    
//    @IBOutlet weak var txtstate: UITextField!
//
//    @IBOutlet weak var btncity: UIButton!
//
//
//    @IBOutlet weak var txtcity: UITextField!
//
//    @IBOutlet weak var txtzipcode: UITextField!
    
    @IBOutlet weak var txtaddress: UITextField!
    
    
    @IBOutlet weak var btnquestion: UIButton!
    
    @IBOutlet weak var txtquestion: UITextField!
    
    @IBOutlet weak var txtanswer: UITextField!
    
    
    @IBOutlet weak var logiView: UIView!
    
    @IBOutlet weak var txtlogo: UITextField!
    
    @IBOutlet weak var txtdiscription: UITextView!
    
    @IBOutlet weak var discriptinView: UIView!
    
    
    @IBOutlet weak var descriptionUrView: UIView!
       
    @IBOutlet weak var txtdescriptionUr: UITextView!
    
    var cityDropdown = DropDown()
    var stateDropdown = DropDown()
    var businesstypeDropdown = DropDown()
    var countryDropdown = DropDown()
    var questionDropdown = DropDown()
    
    var countrieslist = [Countries]()
    var statelist = [StatesStates]()
    var citieslist = [Cities]()
    var questionslist = [Question]()
    var  editvendorsBProfile : EditBusinessProfileVendors?
    var docimg:UIImage?
    var docurl = ""
    var Documentpath = ""
    var Documentpath1 = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationController?.navigationBar.isHidden =  false
        btnNext.backgroundColor =  #colorLiteral(red: 0.1764705882, green: 0.8352941176, blue: 0.9764705882, alpha: 1)
        self.title = "Business Profile"
        txtdescriptionUr.delegate = self
         txtdescriptionUr.textColor = UIColor.lightGray
         txtdescriptionUr.text = "Write about Your business(urdu)"
        txtdescriptionUr.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
        
        descriptionUrView.layer.cornerRadius = 10
        descriptionUrView.layer.borderWidth = 1
        descriptionUrView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
        
        txtdiscription.delegate = self
         txtdiscription.textColor = UIColor.lightGray
         txtdiscription.text = "Write about Your Business(en)"
        txtdiscription.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
       
        discriptinView.layer.cornerRadius = 10
        discriptinView.layer.borderWidth = 1
        discriptinView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
        self.txtaddress.delegate =  self
        
          setupView()
        addBackButton()
        
        
//        countiresApi()
        questionsApi()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if fromMyaccount ==  true {
            addBackButton()
            self.navigationController?.navigationBar.isHidden =  false 
            setupEditBProfile()
        }
       
    }
    
    
    func setupEditBProfile() {
        //self.txtcity.text = editvendorsBProfile?.cities
        self.txtlogo.text = editvendorsBProfile?.logo
        self.txtemail.text = editvendorsBProfile?.email
        self.txtphone.text = editvendorsBProfile?.phone
        //self.txtstate.text = editvendorsBProfile?.states
        self.txtanswer.text = editvendorsBProfile?.security_answer
        self.txtaddress.text = editvendorsBProfile?.address
        //self.txtcountry.text = editvendorsBProfile?.countries
        //self.txtzipcode.text = editvendorsBProfile?.zipcode
        self.txtquestion.text = editvendorsBProfile?.question
        self.txtcompanyName.text = editvendorsBProfile?.company_name
        self.txtlegalName.text = editvendorsBProfile?.legal_name
        //self.txtownerName.text = editvendorsBProfile?.owners_name
        self.txtdiscription.text = editvendorsBProfile?.description
        self.txtdescriptionUr.text = editvendorsBProfile?.description_urdu
        self.txtbusinessType.text = editvendorsBProfile?.business_type
        self.txtbusinessNumber.text = editvendorsBProfile?.business_registration_num
        self.txtDocumentAttachment.text = editvendorsBProfile?.business_document
        
         self.Documentpath = editvendorsBProfile?.business_document ?? ""
         self.Documentpath1 = editvendorsBProfile?.logo ?? ""
        self.params.params.updateValue(self.txtbusinessType.text!, forKey: "business_type")
        
        self.params.params.updateValue(self.editvendorsBProfile?.question_id ?? 0, forKey: "question")
        
        self.params.params.updateValue(editvendorsBProfile?.logo ?? "", forKey: "business_document")
        self.params.params.updateValue(editvendorsBProfile?.business_document ?? "", forKey: "logo")
        
        self.params.params.updateValue(editvendorsBProfile?.vendor_longitude ?? 0, forKey: "vendor_longitude")
        self.params.params.updateValue(editvendorsBProfile?.vendor_latitude ?? 0, forKey: "vendor_latitude")
       
    }
    
    
    
    
//    func countiresApi() {
//        userhandler.getCountries(Success: {response in
//            if response.success == 1 {
//                self.countrieslist = response.countries ?? []
//            } else {
//                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
//            }
//        }, Failure: {error in
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
//        })
//    }
    
    func questionsApi() {
        userhandler.getQuestions(Success: {response in
            if response.success == 1 {
                self.questionslist = response.question ?? []
            } else {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    func setupView() {
        
//        billingView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.1410522163, green: 0.3398962617, blue: 0.1778770983, alpha: 1), borderwidth: 1)
//        bankView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.1410522163, green: 0.3398962617, blue: 0.1778770983, alpha: 1), borderwidth: 1)
//        businessInfoView.viewconfig(radius: 5)
        
             btnNext.roundButton()
        

           // ownerNameView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//            companyNameView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//            businesstypeView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//
//            legalNameView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//            businessRegistrationView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//            attachmentView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//
//            emailView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//            phoneNumberView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
           
//            CountryView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//
//           StateView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//
//            citView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//            zipView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//          addressView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//          //packageView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//            questionView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//            answerView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
//            logiView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
        
    }
    
    
    @IBAction func businesstype(_ sender: UIButton) {
        
        businesstypeDropdown.anchorView = btnbusinesstype
                businesstypeDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                businesstypeDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            
              
        businesstypeDropdown.dataSource = ["Import/ Export", "Personal", "Reatiler", "Trade Mark"]
                
                businesstypeDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
                    print(index)
                    self.txtbusinessType.text = item
                    self.params.params.updateValue(self.txtbusinessType.text!, forKey: "business_type")
                }
                businesstypeDropdown.show()
        
    }
    
    
//    @IBAction func countryAction(_ sender: Any) {
//
//        countryDropdown.anchorView = btncountry
//                countryDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                countryDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//            var contryArray = [String]()
//        contryArray = countrieslist.map({$0.name!})
//
//        countryDropdown.dataSource = contryArray
//
//                countryDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
//                    print(index)
//                    self.txtcountry.text = item
//                    self.stateapi(id: self.countrieslist[index].id!)
//                    self.params.params.updateValue(self.countrieslist[index].id!, forKey: "country")
//                }
//                countryDropdown.show()
//
//    }
//
    
   
    
    
    
//    func stateapi(id: Int?) {
//        userhandler.getState(id: id!, Success: {response in
//            if response.success == 1 {
//                self.statelist =  response.states ?? []
//            }else {
//                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
//            }
//        }, Failure: {error in
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
//        })
//    }
//
//
//
//    @IBAction func stateAction(_ sender: Any) {
//
//        stateDropdown.anchorView = btnstate
//                stateDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                stateDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//            var stateArray = [String]()
//        stateArray = statelist.map({$0.name!})
//
//        stateDropdown.dataSource = stateArray
//
//                stateDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
//                    print(index)
//                    self.txtstate.text = item
//                    self.cetiesApi(id: self.statelist[index].id! )
//                    self.params.params.updateValue(self.statelist[index].id!, forKey: "state")
//                }
//                stateDropdown.show()
//
//    }
//
//
//
//
//    func cetiesApi(id: Int? ) {
//        userhandler.getCities(id: id, Success: {response in
//            if response.success == 1 {
//                self.citieslist = response.cities ?? []
//            }else {
//                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
//            }
//        }, Failure: {error in
//             Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
//        })
//    }
//    @IBAction func cityAction(_ sender: Any) {
//
//        cityDropdown.anchorView = btncity
//                cityDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                cityDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//
//              var cityArray = [String]()
//              cityArray = citieslist.map({$0.name!})
//        cityDropdown.dataSource = cityArray
//
//                cityDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
//                    print(index)
//                    self.txtcity.text = item
//
//                    self.params.params.updateValue(self.citieslist[index].id!, forKey:"city")
//                }
//                cityDropdown.show()
//
//    }
    
    @IBAction func questionAction(_ sender: UIButton) {
        
        questionDropdown.anchorView = btnquestion
                questionDropdown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                questionDropdown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            var questionArray = [String]()
        questionArray = questionslist.map({$0.question!})
              
        questionDropdown.dataSource = questionArray
                
                questionDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
                    print(index)
                    self.txtquestion.text = item
                    self.params.params.updateValue(self.questionslist[index].question_id!, forKey: "question")
                }
                questionDropdown.show()
    }
    
    
    
    @IBAction func Attachment(_ sender: UIButton) {
         self.logo =  false
        PickImag()
    }
    
    
    @IBAction func logoAction(_ sender: UIButton) {
        self.logo = true
        PickImag()
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
    
    
    
    @IBAction func btnnext(_ sender: Any) {
        if checkData() {
            
            
            params.params.updateValue(txtcompanyName.text!, forKey: "company_name")
            params.params.updateValue(self.txtanswer.text!, forKey: "answer")
            params.params.updateValue(self.txtphone.text!, forKey: "business_phone")
            params.params.updateValue(self.txtaddress.text!, forKey: "address")
            //params.params.updateValue(self.txtzipcode.text!, forKey: "zipcode")
            params.params.updateValue("1", forKey: "status")
            params.params.updateValue(self.txtlegalName.text!, forKey: "legal_name")
            params.params.updateValue(self.txtbusinessNumber.text!, forKey: "business_registration_num")
            params.params.updateValue(txtemail.text!, forKey: "bussiness_email")
             params.params.updateValue(self.txtdiscription.text!, forKey: "description")
             params.params.updateValue(self.txtdescriptionUr.text!, forKey: "description_urdu")
            params.params.updateValue("1", forKey: "business_status")
            moveonBankDetail()
        }
    }
    func moveonBankDetail() {
        if UIDevice.current.userInterfaceIdiom == .pad {
                  
              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "BankDetailVC") as? BankDetailVC
                  vc?.params = params
             vc?.fromMyaccount =  fromMyaccount
            vc?.editvendorsBProfile =  editvendorsBProfile
              self.navigationController?.pushViewController(vc!, animated: true)
              
              } else {
              
              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "BankDetailVC") as? BankDetailVC
                  vc?.params = params
               vc?.fromMyaccount =  fromMyaccount
            vc?.editvendorsBProfile =  editvendorsBProfile
              self.navigationController?.pushViewController(vc!, animated: true)
              }
    }
    
    func checkData() -> Bool {
       
//        if txtownerName.text == "" {
//            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Owner Name", messagetype: 0)
//            return false
//        } else
            if txtbusinessType.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Business Type (e.g Personal,Business)", messagetype: 0)
            return false
        }  else if txtemail.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Email", messagetype: 0)
            return false
        } else if txtemail.text?.isValidEmail == false  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Valid Email", messagetype: 0)
            return false
        } else if txtphone.text == ""  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Phone Number", messagetype: 0)
            return false
        } else if txtanswer.text == ""  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Question Answer", messagetype: 0)
            return false
        }else if txtaddress.text == ""  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Address", messagetype: 0)
            return false
        } else if txtquestion.text == ""  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Select The Question", messagetype: 0)
            return false
        }else if txtlegalName.text == ""  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Legal Name (e.g zaraat.com)", messagetype: 0)
            return false
        }else if txtcompanyName.text == ""  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Company Name", messagetype: 0)
            return false
            } else if txtbusinessNumber.text?.isValidCode == false  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Business Register Number (e.g 11234567-2) ", messagetype: 0)
            return false
        }else if txtDocumentAttachment.text == ""  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Select The Busines Document (e.g image)", messagetype: 0)
            return false
        }else if txtlogo.text == ""  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Select The Busines Logo (e.g image)", messagetype: 0)
            return false
        }else if txtdiscription.text == ""  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Description About Your Business(en)", messagetype: 0)
            return false
        }
        else if txtdescriptionUr.text == ""  {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Description About Your Business(urud)", messagetype: 0)
            return false
        }
        return true
    }
    
    
    
    @IBAction func PreviewDocumentAction(_ sender: UIButton) {
        
        
        if(self.Documentpath == ""){
            
            self.alertMessage(message: "No File Uploaded Yet", completionHandler:nil)
            
        }else{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreviewImageVC") as! PreviewImageVC
            vc.policyPath = self.Documentpath
        vc.modalPresentationStyle = .currentContext
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        vc.view.backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
        self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func logoPrevoewAction(_ sender: Any) {
        
        
        if(self.Documentpath1 == ""){
            
            self.alertMessage(message: "No File Uploaded Yet", completionHandler:nil)
            
        }else{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreviewImageVC") as! PreviewImageVC
            vc.policyPath = self.Documentpath1
        vc.modalPresentationStyle = .currentContext
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        vc.view.backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
        self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    
}
extension BusinessInfoVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        self.docimg = img
        uploaddocApi(img:img)
        dismiss(animated: true, completion: nil)
    }
    
    
    func uploaddocApi(img:UIImage?) {
        ShareData.showProgress()
        userhandler.UploadDocument(img: img!, Success: {response in
            ShareData.hideProgress()
            self.docurl = response.path ?? ""
            
            if self.logo == true {
                self.txtlogo.text = "Logo has Uploaded"
                  self.Documentpath1 = response.path ?? ""
            self.params.params.updateValue(response.path ?? "", forKey: "logo")
            } else {
                self.txtDocumentAttachment.text = "Document has Uploaded"
                self.Documentpath = response.path ?? ""
            self.params.params.updateValue(response.path ?? "", forKey: "business_document")
                
            }
        }, Failure: {error in
            
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }

}




//extension BusinessInfoVC: UITextViewDelegate{
    
    
    //func textViewDidBeginEditing(_ textView: UITextView) {
      //  if textView.text == "Write about Your Business(en)" {
          //  textView.text = ""
          //  textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            
        //}
//else if textView.text == "Write about Your Business(urdu)"{
            
           // textView.text = ""
            //textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            
       // }
      
        
   // }
    
    //func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
     //   if text == "\n" {
     //       textView.resignFirstResponder()
     //   }
      //  return true
   // }
    
   // func textViewDidEndEditing(_ textView: UITextView) {
       // if textView == txtdescriptionUr {
         //   if textView.text == ""{
         //   textView.text = "Write about Your Business(urdu)"
          //  textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            
           // }
        //}
       // else if textView == txtdiscription {
           // if textView.text == ""{
             //   textView.text = "Write about Your Business(en)"
             //   textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
               
           // }
        //}
        
        
    //}
    
    
    
    
    
    
//}
extension BusinessInfoVC: UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Write about Your Business(en)" {
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            
        }
        else if textView.text == "Write about Your business(urdu)"{
            
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
        if textView == txtdiscription {
            if textView.text == ""{
            textView.text = "Write about Your Business(en)"
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            
            }
        }
        else if textView == txtdescriptionUr {
            if textView.text == ""{
                textView.text = "Write about Your business(urdu)"
                textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
               
            }
        }
        
        
    }
    
    
    
    
    
    
}


//MARK:- AutoCompleteAddress
extension BusinessInfoVC: UITextFieldDelegate {

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.txtaddress {
            let autoComplete = GMSAutocompleteViewController()
            autoComplete.delegate = self
//            UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1026112512, green: 0.6214135885, blue: 0.06590007991, alpha: 1)
//            UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.1026112512, green: 0.6214135885, blue: 0.06590007991, alpha: 1)
            present(autoComplete, animated: true, completion: nil)
        }

        let placePickerController = GMSAutocompleteViewController()
        placePickerController.delegate = self
        self.present(placePickerController, animated: true) {
        }
//        let config = GMSPlacePickerConfig(viewport: nil)
//        let placePicker = GMSPlacePickerViewController(config: config)
//        placePicker.delegate = self
//        present(placePicker, animated: true, completion: nil)
    }
}
///GMSAutocompleteViewControllerDelegate
extension BusinessInfoVC: GMSAutocompleteViewControllerDelegate {
    



//    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
//        print(place.coordinate.latitude)
//        print(place.coordinate.longitude)
////        self.my_lat = place.coordinate.latitude
////        self.my_long = place.coordinate.longitude
////        print(place.formattedAddress!)
//
//        if(place.formattedAddress == "" || place.formattedAddress == nil){
//            self.txtaddress.text = "Unknown place Cordinates Selected  " +  "\(place.coordinate.latitude)" + "  " + "\(place.coordinate.longitude)"
//        }else{
//            self.txtaddress?.text = place.formattedAddress!
//        }
//
//        dismiss(animated: true, completion: nil)
//    }


    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {

        print(place.coordinate.latitude)
        print(place.coordinate.longitude)
        
        self.params.params.updateValue(place.coordinate.longitude, forKey: "vendor_longitude")
        self.params.params.updateValue(place.coordinate.latitude, forKey: "vendor_latitude")
//        self.my_lat = place.coordinate.latitude
//        self.my_long = place.coordinate.longitude
        //        print(place.formattedAddress!)

        if(place.formattedAddress == "" || place.formattedAddress == nil){
            self.txtaddress.text = "Unknown place Cordinates Selected" + "  " +  "\(place.coordinate.latitude)" + "  " + "\(place.coordinate.longitude)"
           
        }else{
            self.txtaddress?.text = place.formattedAddress!
        }

        dismiss(animated: true, completion: nil)

    }

    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {

        viewController.dismiss(animated: true, completion: nil)

        print("No place selected")
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {

        print("Error: ", error.localizedDescription)
    }

    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion:nil )
    }


    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }


    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didSelect prediction: GMSAutocompletePrediction) -> Bool {
        dismiss(animated: true, completion: nil)
        return true
    }


}
