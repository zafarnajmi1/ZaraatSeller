//
//  AddDealVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import YPImagePicker
import AVFoundation
import AVKit
import Photos
import  DropDown
class AddDealVC: UIViewController,deleteDealProduct,UITextFieldDelegate {
    
    @IBOutlet weak var btnstatus: UIButton!
    
    @IBOutlet weak var txtstatus: UITextField!
    @IBOutlet weak var dealStatusView: UIView!
    
    @IBOutlet weak var productListView: UIView!
    var selectedItems = [YPMediaItem]()
    var ProductdropDown = DropDown()
     var dealdropDown = DropDown()
     @IBOutlet weak var clView: UICollectionView!
    
    @IBOutlet weak var btnproduct: UIButton!
    @IBOutlet weak var txtproduct: UITextField!
    @IBOutlet weak var productView: UIView!
    
    @IBOutlet weak var titleEnView: UIView!
    @IBOutlet weak var titleUrduView: UIView!
    
    @IBOutlet weak var dealPriceView: UIView!
    
    @IBOutlet weak var ViedoView: UIView!
    
    @IBOutlet weak var imageView: UIView!
    
    @IBOutlet weak var startDateView: UIView!
    
    @IBOutlet weak var endDateView: UIView!
    
    @IBOutlet weak var descriptionEnView: UIView!
    
    @IBOutlet weak var descriptionUrduView: UIView!
    
    @IBOutlet weak var btnAddDeal: UIButton!
    
    
    @IBOutlet weak var txttitleen: UITextField!
    
    
    @IBOutlet weak var txttitleUrdu: UITextField!
    
    @IBOutlet weak var txtvideo: UITextField!
    
    @IBOutlet weak var txtdeal: UITextField!
    
    @IBOutlet weak var txtimg: UITextField!
    
    
    @IBOutlet weak var txtstrtDate: UITextField!
    
    @IBOutlet weak var txtendDate: UITextField!
    
    
    @IBOutlet weak var txtdescriptionUrdu: UITextView!
    @IBOutlet weak var txtdescriptionEn: UITextView!
    
    
    let startdatePicker = UIDatePicker()
    let edndatePicker = UIDatePicker()
    var imgpath = ""
    var videopath = ""
    var img : UIImage?
    var videourl : URL?
    var  videoimge : Bool?
    
    var checktype : Bool?
     var productsList = [Products]()
    var listOfFeature = [String]()
    var produtIds = [Int]()
    var status = 0
    var dealid = 0
    
    var dealDetail : DealDeatilDeal?
    var  dealproducts = [Deal_products]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clView.register(UINib.init(nibName: "DealProductCell", bundle: nil), forCellWithReuseIdentifier: "DealProductCell")
        self.txtendDate.delegate =  self
        self.txtstrtDate.delegate =  self
        addBackButton()
        self.setUpDeal()
         getProductApi()
        
        
        
        if checktype == false {
            self.title = "Edit Deal"
            btnAddDeal.setTitle("Edit Deal", for: .normal)
            dealDetailApi()
        } else {
            self.title = "Add Deal"
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    func setUpDeal(){
        
        
        txtdescriptionEn.delegate = self
         txtdescriptionEn.textColor = UIColor.lightGray
         txtdescriptionEn.text = "Description(En)"
        txtdescriptionEn.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
        
        
        
        txtdescriptionUrdu.delegate = self
         txtdescriptionUrdu.textColor = UIColor.lightGray
         txtdescriptionUrdu.text = "Description(urdu)"
        txtdescriptionUrdu.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
        
        productListView.layer.borderWidth = 1
        productListView.layer.borderColor = #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1)
        productListView.layer.cornerRadius =  8
        
        
         titleEnView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        titleUrduView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        dealPriceView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        ViedoView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
         imageView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
         startDateView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
         endDateView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        productView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        
        descriptionEnView.layer.cornerRadius = 10
        descriptionEnView.layer.borderWidth = 1
        descriptionEnView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
        
        descriptionUrduView.layer.cornerRadius = 10
        descriptionUrduView.layer.borderWidth = 1
        descriptionUrduView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
        dealStatusView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        //self.txtaddress.delegate =  self
        btnAddDeal.roundButton()
    }
    
    
    func getProductApi() {
        ShareData.showProgress()
        userhandler.getVendorProducts(Success: {response in
           
             ShareData.hideProgress()
            if  response.success == 1 {
                self.productsList = response.products ?? []
                
               
            } else {
                ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
   
    func dealDetailApi(){
        self.listOfFeature.removeAll()
        self.produtIds.removeAll()
        ShareData.showProgress()
        userhandler.getSinglDeal(id: dealid, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.dealDetail = response.deal
                
                self.txtdeal.text =  response.deal?.deal_price
                self.txtendDate.text = response.deal?.deal_end_date
                
                  self.txtstrtDate.text = response.deal?.deal_start_date

                  self.txttitleen.text = response.deal?.deal_title_en
                self.txttitleUrdu.text = response.deal?.deal_title_urdu
                
                self.videourl = URL(string: response.deal?.deal_video ?? "")
                
                
                
                self.dealproducts = response.deal_products ?? []
                for item in  self.dealproducts {
                    self.listOfFeature.append(item.product_title_en!)
                    self.produtIds.append(item.products_id!)
                }
                
                self.txtdescriptionEn.text =  response.deal?.deal_desc_en
                self.txtdescriptionUrdu.text =  response.deal?.deal_desc_urdu
                if response.deal?.deal_status == 1 {
                    self.status = 1
                    self.txtstatus.text = "Active"
                } else {
                    self.status = 1
                    self.txtstatus.text = "In Active"
                }
                
                self.clView.reloadData()
            } else {
                ShareData.hideProgress()
                Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    
    
    
    
    
    
    @objc func pickerChnaged1(_ picker : UIDatePicker){
          if picker == edndatePicker {
               print("Date :\(picker.date)")
               setdateofEnd(date: edndatePicker.date)
           }
       }
       
       @objc func pickerChnaged(_ picker : UIDatePicker){
           if picker == startdatePicker {
               print("Date :\(picker.date)")
               setdateofStart(date: startdatePicker.date)
           }
       }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
           if textField == self.txtstrtDate {
               let datePicker = startdatePicker
               textField.inputView = datePicker
            datePicker.datePickerMode = .date
             datePicker.minimumDate = Date()
              datePicker.addTarget(self, action: #selector(pickerChnaged(_:)), for: UIControl.Event.valueChanged)
           } else if textField == self.txtendDate  {
               let datePicker = edndatePicker
               textField.inputView = datePicker
             datePicker.datePickerMode = .date
               datePicker.minimumDate = Date()
               datePicker.addTarget(self, action: #selector(pickerChnaged1(_:)), for: UIControl.Event.valueChanged)
           }
       }
    
    
       func setdateofStart(date : Date){
            
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd" //"dd,MMMM, yyyy" //HH:mm
            let stringDate = dateFormatter.string(from: date)
            self.txtstrtDate.text = stringDate

    
            
        }
    
    
    func setdateofEnd(date : Date){
    
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd" //HH:mm
            let stringDate = dateFormatter.string(from: date)
            self.txtendDate.text = stringDate
    }
    
    
    
    
    @IBAction func attachVideoAction(_ sender: Any) {
        videoimge = true
        showImgPicker()
    }
    
    

            func showImgPicker() {
                
                var config = YPImagePickerConfiguration()

                

               
                 config.library.onlySquare = true

              
                config.onlySquareImagesFromCamera = false

              
                // config.targetImageSize = .cappedTo(size: 1024)

              
                config.library.mediaType = .photoAndVideo

                
                  config.usesFrontCamera = true

               
                 config.showsPhotoFilters = false

               
                config.shouldSaveNewPicturesToAlbum = false

               
                config.video.compression = AVAssetExportPresetMediumQuality
                
             
                config.startOnScreen = .library

                /* Defines which screens are shown at launch, and their order.
                   Default value is `[.library, .photo]` */
                if videoimge ==  true {
                     config.screens = [.library,.video]
                } else {
                   config.screens = [.library, .photo]
                }
                  config.video.recordingTimeLimit = 5.0

                
                config.video.libraryTimeLimit = 500.0

        
                config.wordings.libraryTitle = "Gallery"

              
                config.hidesStatusBar = false

               
                config.hidesBottomBar = false
                
                config.maxCameraZoomFactor = 2.0

                config.library.maxNumberOfItems = 1
                config.gallery.hidesRemoveButton = false
                
               
                
                
                 config.library.skipSelectionsGallery = true

              
                
                

                config.library.preselectedItems = selectedItems
                
                let picker = YPImagePicker(configuration: config)

                /* Change configuration directly */
                // YPImagePickerConfiguration.shared.wordings.libraryTitle = "Gallery2"
                

                /* Multiple media implementation */
    //            picker.didFinishPicking { [unowned picker] items, cancelled in
    //
    //                if cancelled {
    //                    print("Picker was canceled")
    //                    picker.dismiss(animated: true, completion: nil)
    //                    return
    //                }
    //                _ = items.map { print("🧀 \($0)") }
    //
    //                self.selectedItems = items
    //
    //                if let firstItem = items.first {
    //                    switch firstItem {
    //                    case .photo(let photo):
    //                        print("i am image", photo.image)
    //                        //self.uploadGalleryApi(img: [photo.image])
    //                        //self.selectedImageV.image = photo.image
    //                        picker.dismiss(animated: true, completion: nil)
    //                    case .video(let video):
    //                        //self.selectedImageV.image = video.thumbnail
    //
    //                        let assetURL = video.url
    //                        let playerVC = AVPlayerViewController()
    //                        let player = AVPlayer(playerItem: AVPlayerItem(url:assetURL))
    //                        playerVC.player = player
    //
    //                        picker.dismiss(animated: true, completion: { [weak self] in
    //                            self?.present(playerVC, animated: true, completion: nil)
    //                            //print("😀 \(String(describing: self?.resolutionForLocalVideo(url: assetURL)!))")
    //                        })
    //                    }
    //                }
    //            }

                
                
                picker.didFinishPicking { [unowned picker] items, cancelled in
                    for item in items {
                        switch item {
                        case .photo(let photo):
                           
                            self.img = photo.image
                            print(photo.originalImage)
                            print("i am here ",photo.image)

                        case .video(let video):
                            print(video.url.baseURL?.absoluteURL)
                            print(video.url.lastPathComponent)
                            self.videourl = video.url.resolvingSymlinksInPath()
                            print(self.videourl)

                        }
                    }

                    if self.videoimge == false {
                        self.dealimgupload(img: self.img ?? UIImage())
                    } else {
                        self.dealVideoupload(url:self.videourl!)
                    }
//                    self.uploadGalleryApi(img: self.ProImg)
                    picker.dismiss(animated: true, completion: nil)
                }
//
                
                
                
                
                
                
//                 //Single Photo implementation.
//                 picker.didFinishPicking { [unowned picker] items, _ in
//                     self.selectedItems = items
//                    // self.selectedImageV.image = items.singlePhoto?.image
//                       print(items.singlePhoto?.image)
//                     picker.dismiss(animated: true, completion: nil)
//                 }
//
//                // Single Video implementation.
//                picker.didFinishPicking { [unowned picker] items, cancelled in
//                    if cancelled { picker.dismiss(animated: true, completion: nil); return }
//
//                    self.selectedItems = items
//                    //self.selectedImageV.image = items.singleVideo?.thumbnail
//
//                    let assetURL = items.singleVideo!.url
//                    print(items.singleVideo?.asset)
////                    let playerVC = AVPlayerViewController()
////                    let player = AVPlayer(playerItem: AVPlayerItem(url:assetURL))
////                    playerVC.player = player
//
////                    picker.dismiss(animated: true, completion: { [weak self] in
////                        //self?.present(playerVC, animated: true, completion: nil)
////                        //print("😀 \(String(describing: self?.resolutionForLocalVideo(url: assetURL)!))")
////                    })
//                }

                present(picker, animated: true, completion: nil)
            }
    
    
    
    
    func dealimgupload(img:UIImage) {
        ShareData.showProgress()
        userhandler.uploadDealimage(img: img, Success: {response in
            ShareData.hideProgress()
            self.imgpath =  response.avater ?? ""
            self.txtimg.text = "Image Uploaded"
        }, Failure: {error in
             ShareData.hideProgress()
            Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    func dealVideoupload(url:URL) {
          ShareData.showProgress()
          userhandler.uploadDealVideo(videourl: url, Success: {response in
              ShareData.hideProgress()
            self.videopath =  response.avater ?? ""
            self.txtvideo.text = "Video Uploaded"
          }, Failure: {error in
               ShareData.hideProgress()
              Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
          })
      }
    
    
    
    
    @IBAction func viewVideoAction(_ sender: UIButton) {
        
        
        
    }
    
    
    @IBAction func attchImageAction(_ sender: UIButton) {
        videoimge = false
         showImgPicker()
        
        
    }
    
    @IBAction func viewimageAction(_ sender: UIButton) {
        
        
    }
    
    
    
    func CehckDate() -> Bool {
        if txtdeal.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Deal Price", messagetype: 0)
            return false
        } else if txtvideo.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Deal Video", messagetype: 0)
            return false
        } else if txtimg.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Deal Image", messagetype: 0)
            return false
        } else if txtstatus.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Deal Status", messagetype: 0)
            return false
        } else if txtendDate.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Deal End Date", messagetype: 0)
            return false
        } else if txtstrtDate.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Deal Start Date", messagetype: 0)
            return false
        } else if produtIds.count == 0 {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Deal Products", messagetype: 0)
            return false
        } else if txttitleen.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Deal Title(en)", messagetype: 0)
            return false
        } else if txttitleUrdu.text == "" {
            Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Deal Title (urdu)", messagetype: 0)
            return false
        }
        return true
    }
    
    
    
    
    @IBAction func addDealAction(_ sender: UIButton) {
        if checktype ==  true {
            if CehckDate() {
            createDealApi()
            }
        } else {
            if CehckDate() {
            updateDealApi()
            }
        }
    }
    
    
    func createDealApi() {
        let dic : [String:Any] = ["deal_image": imgpath, "deal_video": videopath, "deal_title_en": txttitleen.text!, "deal_title_urdu":txttitleUrdu.text!, "deal_desc_en":txtdescriptionEn.text!, "deal_desc_urdu":txtdescriptionUrdu.text!, "deal_price":txtdeal.text!, "deal_start_date":txtstrtDate.text!, "deal_end_date": txtendDate.text!, "deal_status":self.status, "products":produtIds]
        print(dic)
        ShareData.showProgress()
        userhandler.createVendorDeal(params: dic, Success: {response in
            ShareData.hideProgress()
            if response.success ==  1 {
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
    
    
    
    
    
    
    func updateDealApi(){
           let dic : [String:Any] = ["deal_image": imgpath, "deal_video": videopath, "deal_title_en": txttitleen.text!, "deal_title_urdu":txttitleUrdu.text!, "deal_desc_en":txtdescriptionEn.text!, "deal_desc_urdu":txtdescriptionUrdu.text!, "deal_price":txtdeal.text!, "deal_start_date":txtstrtDate.text!, "deal_end_date": txtendDate.text!, "deal_status":self.status, "products":produtIds]
           print(dic)
           ShareData.showProgress()
           userhandler.createVendorDeal(params: dic, Success: {response in
               ShareData.hideProgress()
               if response.success ==  1 {
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
    
    
    
    
    
    
    
    @IBAction func dealaction(_ sender: UIButton) {
        
         dealdropDown.anchorView = btnstatus
                            dealdropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                            dealdropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


                          var statustArray = [String]()
                    statustArray = ["Active","In Active"]
                    dealdropDown.dataSource = statustArray

                            dealdropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                                print(index)
                                self.txtstatus.text = item
                                if item == "Active" {
                                    self.status = 1
                                } else {
                                    self.status = 0
                                }
            //
                                
                                
        //                        self.params.params.updateValue(self.categoriesList[index].categories_id!, forKey:"vendor_category_id" )
        //                        self.subgategorapicall(id:self.categoriesList[index].categories_id)

                            }
        
                            dealdropDown.show()
    }
    
    
    
    
    
    

}

extension AddDealVC: UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Description(En)" {
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            
        }
        else if textView.text == "Description(urdu)"{
            
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
        if textView == txtdescriptionEn {
            if textView.text == ""{
            textView.text = "Description(En)"
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            
            }
        }
        else if textView == txtdescriptionUrdu {
            if textView.text == ""{
                textView.text = "Description(urdu)"
                textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
               
            }
        }
        
        
    }
    
    
    

        @IBAction func productAction(_ sender: Any) {


                   ProductdropDown.anchorView = btnproduct
                    ProductdropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    ProductdropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


                  var productArray = [String]()
            productArray = productsList.map({($0.product_title_en ?? "")})
            ProductdropDown.dataSource = productArray

                    ProductdropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                        print(index)
                       
                        self.txtproduct.text = item
                        self.txtproduct.text = ""
                        if self.listOfFeature.contains(item) {
                            print("We've got \(item)!")
                        } else {
                           self.listOfFeature.append(item)
                            self.produtIds.append(self.productsList[index].products_id!)
                            //self.params.features.append(self.categoriesList[index].categories_id!)

                        }
    //
                        
                        self.clView.reloadData()
//                        self.params.params.updateValue(self.categoriesList[index].categories_id!, forKey:"vendor_category_id" )
//                        self.subgategorapicall(id:self.categoriesList[index].categories_id)

                    }
                    ProductdropDown.show()





        }
    
    
    
    
    
    
    
    
    
    
    
   
    func deleteproductList(cell: DealProductCell) {
       
         let indx = clView.indexPath(for: cell)
         self.listOfFeature.remove(at: indx!.row)
        self.produtIds.remove(at: indx!.row)
        // self.params.features.remove(at: indx!.row)
         self.clView.reloadData()
    }
    
    
    
}
extension AddDealVC : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return listOfFeature.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DealProductCell", for: indexPath) as? DealProductCell
        cell?.lbltitle.text =  listOfFeature[indexPath.row]
        cell?.delegate =  self
        return cell!
    }
    
    
}
