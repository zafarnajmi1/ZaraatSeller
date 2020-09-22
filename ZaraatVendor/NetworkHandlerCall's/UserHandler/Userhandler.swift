//
//  Userhandler.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

import Alamofire




class userhandler {
    
    
    class  func login(parms: [String: Any], Success: @escaping (LoginModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Login
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(LoginModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
   
    class  func Register(parms: [String: Any], Success: @escaping (LoginModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Register
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
                print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(LoginModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    
    
    
    
        
    class  func getCategries(parms: [String: Any], Success: @escaping (CategoreisModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.categories
        print("pages Url", url)
        Networkhandler.PostRequest(url: url, parameters: parms,success: {(successResponse) in

            do {
            
                let responseModel = try JSONDecoder().decode(CategoreisModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    class  func getSubCategries(id:Int?, Success: @escaping (SubCategoryModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.pkgCates + "\(id!)"
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(SubCategoryModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
//    
//    
  
    class  func getChildCategory( id:Int?,Success: @escaping (ChildCategory) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.childCates + "\(id!)"
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(ChildCategory.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
//    class  func getCountries( Success: @escaping (CountiresModel) -> Void, Failure: @escaping(NetworkError) -> Void){
//        let url = Constant.MainUrl + Constant.URLs.countries
//        print("pages Url", url)
//        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
//
//            do {
//                let responseModel = try JSONDecoder().decode(CountiresModel.self, from: successResponse.data!)
//                Success(responseModel)
//            }
//            catch {
//                print("Response Error")
//            }
//
//
//        } , Falioure: {(Error) in
//            Failure(Error)
//        })
//    }
//
//    class  func getState(id:Int?, Success: @escaping (StateModel) -> Void, Failure: @escaping(NetworkError) -> Void){
//        let url = Constant.MainUrl + Constant.URLs.state + "\(id!)"
//        print("pages Url", url)
//        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
//
//            do {
//                let responseModel = try JSONDecoder().decode(StateModel.self, from: successResponse.data!)
//                Success(responseModel)
//            }
//            catch {
//                print("Response Error")
//            }
//
//
//        } , Falioure: {(Error) in
//            Failure(Error)
//        })
//    }
//
//    class  func getCities(id:Int?, Success: @escaping (CitiesModel) -> Void, Failure: @escaping(NetworkError) -> Void){
//        let url = Constant.MainUrl + Constant.URLs.cities + "\(id!)"
//        print("pages Url", url)
//        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
//
//            do {
//                let responseModel = try JSONDecoder().decode(CitiesModel.self, from: successResponse.data!)
//                Success(responseModel)
//            }
//            catch {
//                print("Response Error")
//            }
//
//
//        } , Falioure: {(Error) in
//            Failure(Error)
//        })
//    }

    class  func getQuestions( Success: @escaping (QuestionsModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url =  Constant.URLs.Questions
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(QuestionsModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    class  func UploadDocument(img: UIImage?, Success: @escaping (DocumentUpload) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = "http://apiengine.zaraat.com/api/vendors/document"//Constant.MainUrl + Constant.URLs.document
        
        Networkhandler.UploadImage(url: url, parameters: nil, userimg: img! , Progress: { progress in
            
            
        }, Success: {successResponse in
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(DocumentUpload.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
        }, Falioure: {Error in
            Failure(Error)
        })
    }
    
    
    
    class  func businessProfile(parms: [String: Any], Success: @escaping (BusinesProfileModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Profile
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
                print(successResponse)
                let responseModel = try JSONDecoder().decode(BusinesProfileModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    class  func editbusinessProfile(parms: [String: Any], Success: @escaping (EditBusinessProfile) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.editBusinessProfile
        
        Networkhandler.GetRequiest(url: url, parameters: nil, success: {(successResponse) in
            
            do {
                print(successResponse)
                let responseModel = try JSONDecoder().decode(EditBusinessProfile.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    
    
    class  func Logout( Success: @escaping (LogoutModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.LogOut
        
        Networkhandler.PostRequest(url: url, parameters: nil, success: {(successResponse) in
            
            do {
                let responseModel = try JSONDecoder().decode(LogoutModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    
    
    class  func getBanksList( Success: @escaping (BanksModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.BankList
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(BanksModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
//    class  func addProducts(param: [String:Any], Success: @escaping (AddProductsModel) -> Void, Failure: @escaping(NetworkError) -> Void){
//        print(param)
//        let url = Constant.MainUrl + Constant.URLs.AddProduct
//
//        Networkhandler.PostRequest(url: url, parameters: param, success: {(successResponse) in
//
//            do {
//                let responseModel = try JSONDecoder().decode(AddProductsModel.self, from: successResponse.data!)
//                Success(responseModel)
//            }
//            catch {
//                print("Response Error")
//            }
//
//
//        } , Falioure: {(Error) in
//            Failure(Error)
//        })
//    }
    
    
    class  func getVendorProducts( Success: @escaping (GetProducts) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.getProducts
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                print("products",successResponse)
                let responseModel = try JSONDecoder().decode(GetProducts.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    class  func getVendorProductsCategory( Success: @escaping (GetProductsCategoris) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.CategoriProducts
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(GetProductsCategoris.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    class  func getVendorSubCategoryProducts(id: Int ,Success: @escaping (GetProductsSubCategories) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.SubProducts + "\(id)"
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(GetProductsSubCategories.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    class  func getVendorChildProducts(id: Int, Success: @escaping (GetProductsChildCategories) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.ChildProducts  + "\(id)"
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(GetProductsChildCategories.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    

    
    class  func userprofile( Success: @escaping (UserProfile) -> Void, Failure: @escaping(NetworkError) -> Void){
         let url = Constant.MainUrl + Constant.URLs.userProfileGet
         print("pages Url", url)
         Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

             do {
                 let responseModel = try JSONDecoder().decode(UserProfile.self, from: successResponse.data!)
                 Success(responseModel)
             }
             catch {
                 print("Response Error")
             }


         } , Falioure: {(Error) in
             Failure(Error)
         })
     }
    
    
    class  func userprofileUpdate(parms: [String: Any], Success: @escaping (UserProfile) -> Void, Failure: @escaping(NetworkError) -> Void){
           let url = Constant.MainUrl + Constant.URLs.updateprofilePost
           print("parms :", parms)
           Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
               print(successResponse)
               do {
                print(successResponse)
                   let responseModel = try JSONDecoder().decode(UserProfile.self, from: successResponse.data!)
                   Success(responseModel)
               }
               catch {
                   print("Response Error")
               }
               
               
           } , Falioure: {(Error) in
               Failure(Error)
           })
       }
       


    class  func getAddProductCategories( Success: @escaping (AddproductGetCategories) -> Void, Failure: @escaping(NetworkError) -> Void){
         let url = Constant.MainUrl + Constant.URLs.addProductCategories
         print("pages Url", url)
         Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

             do {
                print(successResponse)
                 let responseModel = try JSONDecoder().decode(AddproductGetCategories.self, from: successResponse.data!)
                 Success(responseModel)
             }
             catch {
                 print("Response Error")
             }


         } , Falioure: {(Error) in
             Failure(Error)
         })
     }
    
    
    
    
    
    class  func ProductAddGetSucCategories(id: Int ,Success: @escaping (AddProductGetSubcatgories) -> Void, Failure: @escaping(NetworkError) -> Void){
           let url = Constant.MainUrl + Constant.URLs.addproductGetSubCategories + "\(id)"
           print("pages Url", url)
           Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

               do {
                print(successResponse)
                   let responseModel = try JSONDecoder().decode(AddProductGetSubcatgories.self, from: successResponse.data!)
                   Success(responseModel)
               }
               catch {
                   print("Response Error")
               }


           } , Falioure: {(Error) in
               Failure(Error)
           })
       }
    
    
    
    class  func ProductAddGetChildCategories(id: Int ,Success: @escaping (AddproductGetChildCategories) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.addProductGetChildCategories + "\(id)"
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                print(successResponse)
                let responseModel = try JSONDecoder().decode(AddproductGetChildCategories.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    class  func UplodGallery(img: [UIImage], Success: @escaping (AddGallery) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.addGalleryimages
        Networkhandler.UploadImage1(url: url, filename: "avatar[]", parameters: nil, gellaryimg: img, Progress: {progress in
            print(progress)
        }, Success: {successResponse in
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(AddGallery.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }} , Falioure: {Error in
                Failure(Error)

        })

    }
    
    
    
    class  func addProducts(parms: [String:Any], Success: @escaping (AddProductsModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.AddProduct
        Networkhandler.PostRequest(url: url, parameters: parms, success: {  successResponse in
            
            do {
             print("MyResponse : ", successResponse)
                 let responseModel = try JSONDecoder().decode(AddProductsModel.self, from: successResponse.data!)
                 Success(responseModel)
             }
             catch {
                 print("Response Error")
             }
        }, Falioure: {  Error in
            Failure(Error)
        })
        
    }
    
    class  func updateProducts(id:String,parms: [String:Any], Success: @escaping (AddProductsModel) -> Void, Failure: @escaping(NetworkError) -> Void){
         let url = Constant.MainUrl + Constant.URLs.updateProduct + "\(id)"//Constant.MainUrl + Constant.URLs.addGalleryimages
        Networkhandler.PostRequest(url: url, parameters: parms, success: {  successResponse in
            
            do {
             print("MyResponse : ", successResponse)
                 let responseModel = try JSONDecoder().decode(AddProductsModel.self, from: successResponse.data!)
                 Success(responseModel)
             }
             catch {
                 print("Response Error")
             }
        }, Falioure: {  Error in
            Failure(Error)
        })
        
        
//        (url: url, filename: "avatar[]", parameters: parms, gellaryimg: img, Progress: {progress in
//             print(progress)
//         }, Success: {successResponse in
//             do {
//             print("MyResponse : ", successResponse)
//                 let responseModel = try JSONDecoder().decode(AddProductsModel.self, from: successResponse.data!)
//                 Success(responseModel)
//             }
//             catch {
//                 print("Response Error")
//             }} , Falioure: {Error in
//                 Failure(Error)
//
//         })
         
     }
    
    
    class  func viewVendorProduct(id : Int, Success: @escaping (ViewProductsModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.ViewProduct + "\(id)"
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                print("products",successResponse)
                let responseModel = try JSONDecoder().decode(ViewProductsModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    class  func deleteGalleryProduct(id: Int ,Success: @escaping (DeleteGallery) -> Void, Failure: @escaping(NetworkError) -> Void){
         let url = Constant.MainUrl + Constant.URLs.deleteImg + "\(id)"
         print("pages Url", url)
         Networkhandler.PostRequest(url: url, parameters: nil, success: {(successResponse) in
                    
            do {
                let responseModel = try JSONDecoder().decode(DeleteGallery.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
     }
    
    
    
    class  func deleteProduct(id: Int ,Success: @escaping (DeleteProductModel) -> Void, Failure: @escaping(NetworkError) -> Void){
            let url = Constant.MainUrl + Constant.URLs.DeletePrduct + "\(id)"
            print("pages Url", url)
            Networkhandler.PostRequest(url: url, parameters: nil, success: {(successResponse) in
                       
               do {
                   let responseModel = try JSONDecoder().decode(DeleteProductModel.self, from: successResponse.data!)
                   Success(responseModel)
               }
               catch {
                   print("Response Error")
               }
               
               
           } , Falioure: {(Error) in
               Failure(Error)
           })
        }
    
    
    
    class  func createVendorDeal(params:[String:Any],Success: @escaping (CreateDealModel) -> Void, Failure: @escaping(NetworkError) -> Void){
               let url = Constant.MainUrl + Constant.URLs.CreateDeal 
               print("pages Url", url)
               Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                          
                  do {
                    print(successResponse)
                      let responseModel = try JSONDecoder().decode(CreateDealModel.self, from: successResponse.data!)
                      Success(responseModel)
                  }
                  catch {
                      print("Response Error")
                  }
                  
                  
              } , Falioure: {(Error) in
                  Failure(Error)
              })
           }
    
    
    
    class  func uploadDealimage(img: UIImage, Success: @escaping (uploadDealImage) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.dealimgUpload
        
        Networkhandler.UploaDealImage(url: url, filename: "deal_image", parameters: nil, img: img, Progress: { progress in
            
            
        }, Success: {successResponse in
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(uploadDealImage.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
        }, Falioure: {Error in
            Failure(Error)
        })
    }
    class  func uploadDealVideo(videourl: URL, Success: @escaping (uploadDealImage) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.dealVideoUpload
        print(videourl)
        Networkhandler.Uploadfiels(url: url, filename: "deal_video", parameters: nil, videourl: videourl , Progress: { progress in
            
            
        }, Success: {successResponse in
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(uploadDealImage.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
        }, Falioure: {Error in
            Failure(Error)
        })
    }
    
    
    
    
    class  func createCoupon(params:[String:Any],Success: @escaping (CouponModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.CreateCoupon
        print("pages Url", url)
        
        
        print("Parameter Data ", params)
        Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                   
           do {
             print(successResponse)
               let responseModel = try JSONDecoder().decode(CouponModel.self, from: successResponse.data!)
               Success(responseModel)
           }
           catch {
               print("Response Error")
           }
           
           
       } , Falioure: {(Error) in
           Failure(Error)
       })
    }
    
    
    
    class  func couponsList( Success: @escaping (CouponsListModel) -> Void, Failure: @escaping(NetworkError) -> Void){
           let url = Constant.MainUrl + Constant.URLs.getCoupon
           print("pages Url", url)
           Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

               do {
                   print("products",successResponse)
                   let responseModel = try JSONDecoder().decode(CouponsListModel.self, from: successResponse.data!)
                   Success(responseModel)
               }
               catch {
                   print("Response Error")
               }


           } , Falioure: {(Error) in
               Failure(Error)
           })
       }
       
    
    
    
    
    
    class  func getSingleCoupon(id: Int, Success: @escaping (GetSingleCouponModel) -> Void, Failure: @escaping(NetworkError) -> Void){
           let url = Constant.MainUrl + Constant.URLs.getSingleCoupon  + "\(id)"
           print("pages Url", url)
           Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

               do {
                   let responseModel = try JSONDecoder().decode(GetSingleCouponModel.self, from: successResponse.data!)
                   Success(responseModel)
               }
               catch {
                   print("Response Error")
               }


           } , Falioure: {(Error) in
               Failure(Error)
           })
       }
    
    
    
    class  func updateCoupon(params:[String:Any],Success: @escaping (CouponModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.updateCoupon
        print("pages Url", url)
        
        
        print("Parameter Data ", params)
        Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                   
           do {
             print(successResponse)
               let responseModel = try JSONDecoder().decode(CouponModel.self, from: successResponse.data!)
               Success(responseModel)
           }
           catch {
               print("Response Error")
           }
           
           
       } , Falioure: {(Error) in
           Failure(Error)
       })
    }
    
    
    
    class  func deleteCoupon(params:[String:Any],Success: @escaping (DeleteCouponModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.deleteCoupon
        print("pages Url", url)
        
        
        print("Parameter Data ", params)
        Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                   
           do {
             print(successResponse)
               let responseModel = try JSONDecoder().decode(DeleteCouponModel.self, from: successResponse.data!)
               Success(responseModel)
           }
           catch {
               print("Response Error")
           }
           
           
       } , Falioure: {(Error) in
           Failure(Error)
       })
    }
    
    
    
    
    class  func createSale(params:[String:Any],Success: @escaping (UpdateSaleModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.saleCreate
        print("pages Url", url)
        
        
        print("Parameter Data ", params)
        Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                   
           do {
             print(successResponse)
               let responseModel = try JSONDecoder().decode(UpdateSaleModel.self, from: successResponse.data!)
               Success(responseModel)
           }
           catch {
               print("Response Error")
           }
           
           
       } , Falioure: {(Error) in
           Failure(Error)
       })
    }
    
    class  func updateSale(params:[String:Any],Success: @escaping (UpdateSaleModel) -> Void, Failure: @escaping(NetworkError) -> Void){
           let url = Constant.MainUrl + Constant.URLs.updateSale
           print("pages Url", url)
           
           
           print("Parameter Data ", params)
           Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                      
              do {
                print(successResponse)
                  let responseModel = try JSONDecoder().decode(UpdateSaleModel.self, from: successResponse.data!)
                  Success(responseModel)
              }
              catch {
                  print("Response Error")
              }
              
              
          } , Falioure: {(Error) in
              Failure(Error)
          })
       }
    
    
    
    
    class  func saleList( Success: @escaping (SalesListProducts) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.saleList
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                print("products",successResponse)
                let responseModel = try JSONDecoder().decode(SalesListProducts.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    class  func getSingleSale(id: Int, Success: @escaping (SaleDetailModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.saleDetail  + "\(id)"
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(SaleDetailModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    class  func deleteSale(params:[String:Any],Success: @escaping (DealDeleteModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.deleteSale
        print("pages Url", url)
        
        
        print("Parameter Data ", params)
        Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                   
           do {
             print(successResponse)
               let responseModel = try JSONDecoder().decode(DealDeleteModel.self, from: successResponse.data!)
               Success(responseModel)
           }
           catch {
               print("Response Error")
           }
           
           
       } , Falioure: {(Error) in
           Failure(Error)
       })
    }
    
    
    
    
    
    
    
    
    
    
    class  func getSinglDeal(id: Int, Success: @escaping (DealDeatilModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.DealDetail  + "\(id)"
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(DealDeatilModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    class  func dealList( Success: @escaping (DealsListModel) -> Void, Failure: @escaping(NetworkError) -> Void){
         let url = Constant.MainUrl + Constant.URLs.DealList
         print("pages Url", url)
         Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

             do {
                 print("products",successResponse)
                 let responseModel = try JSONDecoder().decode(DealsListModel.self, from: successResponse.data!)
                 Success(responseModel)
             }
             catch {
                 print("Response Error")
             }


         } , Falioure: {(Error) in
             Failure(Error)
         })
     }
    
    
    class  func deleteDeal(params:[String:Any],Success: @escaping (DealDeleteModel) -> Void, Failure: @escaping(NetworkError) -> Void){
          let url = Constant.MainUrl + Constant.URLs.DealDelete
          print("pages Url", url)
          
          
          print("Parameter Data ", params)
          Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                     
             do {
               print(successResponse)
                 let responseModel = try JSONDecoder().decode(DealDeleteModel.self, from: successResponse.data!)
                 Success(responseModel)
             }
             catch {
                 print("Response Error")
             }
             
             
         } , Falioure: {(Error) in
             Failure(Error)
         })
      }
    
    
    
    
    class  func updateDeal(params:[String:Any],Success: @escaping (DealDeleteModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.DealUpdate
        print("pages Url", url)
        
        
        print("Parameter Data ", params)
        Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                   
           do {
             print(successResponse)
               let responseModel = try JSONDecoder().decode(DealDeleteModel.self, from: successResponse.data!)
               Success(responseModel)
           }
           catch {
               print("Response Error")
           }
           
           
       } , Falioure: {(Error) in
           Failure(Error)
       })
    }
    
    
    class  func deleteDealSingleItem(params:[String:Any],Success: @escaping (DealDeleteModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.DealSingleItemDelete
        print("pages Url", url)
        
        
        print("Parameter Data ", params)
        Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                   
           do {
             print(successResponse)
               let responseModel = try JSONDecoder().decode(DealDeleteModel.self, from: successResponse.data!)
               Success(responseModel)
           }
           catch {
               print("Response Error")
           }
           
           
       } , Falioure: {(Error) in
           Failure(Error)
       })
    }
    
    
    
    
    
    
    class  func getAttributes( Success: @escaping (VariationModel) -> Void, Failure: @escaping(NetworkError) -> Void){
           let url = Constant.MainUrl + Constant.URLs.Attributes
           print("pages Url", url)
           Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

               do {
                 print(successResponse)
                   let responseModel = try JSONDecoder().decode(VariationModel.self, from: successResponse.data!)
                   Success(responseModel)
               }
               catch {
                   print("Response Error")
               }


           } , Falioure: {(Error) in
               Failure(Error)
           })
       }
    
    
    class  func addVariation(params:[String:Any],Success: @escaping (DealDeleteModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.addvariation
        print("pages Url", url)
        
        
        print("Parameter Data ", params)
        Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                   
           do {
             print(successResponse)
               let responseModel = try JSONDecoder().decode(DealDeleteModel.self, from: successResponse.data!)
               Success(responseModel)
           }
           catch {
               print("Response Error")
           }
           
           
       } , Falioure: {(Error) in
           Failure(Error)
       })
    }
    
    
    
    class  func addFeatures(params:[String:Any],Success: @escaping (DealDeleteModel) -> Void, Failure: @escaping(NetworkError) -> Void){
          let url = Constant.MainUrl + Constant.URLs.addfeatures
          print("pages Url", url)
          
          
          print("Parameter Data ", params)
          Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                     
             do {
               print(successResponse)
                 let responseModel = try JSONDecoder().decode(DealDeleteModel.self, from: successResponse.data!)
                 Success(responseModel)
             }
             catch {
                 print("Response Error")
             }
             
             
         } , Falioure: {(Error) in
             Failure(Error)
         })
      }
      
    
    
    
    
    class  func getVariationDetail(id: Int, Success: @escaping (VariationDetailModel) -> Void, Failure: @escaping(NetworkError) -> Void){
           let url = Constant.MainUrl + Constant.URLs.VariationDetail  + "\(id)"
           print("pages Url", url)
           Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

               do {
                print(successResponse)
                   let responseModel = try JSONDecoder().decode(VariationDetailModel.self, from: successResponse.data!)
                   Success(responseModel)
               }
               catch {
                   print("Response Error")
               }


           } , Falioure: {(Error) in
               Failure(Error)
           })
       }
    
    class  func deleteVariation(params:[String:Any],Success: @escaping (DealDeleteModel) -> Void, Failure: @escaping(NetworkError) -> Void){
          let url = Constant.MainUrl + Constant.URLs.VariationDelete
          print("pages Url", url)
          
          
          print("Parameter Data ", params)
          Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                     
             do {
               print(successResponse)
                 let responseModel = try JSONDecoder().decode(DealDeleteModel.self, from: successResponse.data!)
                 Success(responseModel)
             }
             catch {
                 print("Response Error")
             }
             
             
         } , Falioure: {(Error) in
             Failure(Error)
         })
      }
    
    
    class  func deleteFeatures(params:[String:Any],Success: @escaping (DealDeleteModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.FeaturesDelete
        print("pages Url", url)
        
        
        print("Parameter Data ", params)
        Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                   
           do {
             print(successResponse)
               let responseModel = try JSONDecoder().decode(DealDeleteModel.self, from: successResponse.data!)
               Success(responseModel)
           }
           catch {
               print("Response Error")
           }
           
           
       } , Falioure: {(Error) in
           Failure(Error)
       })
    }
    
    
    
    class  func getPkgs(Success: @escaping (PkgsModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.pkgs
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
             print(successResponse)
                let responseModel = try JSONDecoder().decode(PkgsModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    class  func getPkgDetail(id: Int,Success: @escaping (PkgDetailModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.pkgdetail + "\(id)"
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
             print(successResponse)
                let responseModel = try JSONDecoder().decode(PkgDetailModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
  
    class  func addReceipt(img: UIImage, Success: @escaping (AddReceiptModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.addReceipt
        
        Networkhandler.UploaDealImage(url: url, filename: "picture", parameters: nil, img: img, Progress: { progress in
            
            
        }, Success: {successResponse in
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(AddReceiptModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
        }, Falioure: {Error in
            Failure(Error)
        })
    }
    
    
    
      class  func confirmPakg(params:[String:Any],Success: @escaping (ConfirmPkgModel) -> Void, Failure: @escaping(NetworkError) -> Void){
          let url = Constant.MainUrl + Constant.URLs.confrimPkg
          print("pages Url", url)
          
          
          print("Parameter Data ", params)
          Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                     
             do {
               print(successResponse)
                 let responseModel = try JSONDecoder().decode(ConfirmPkgModel.self, from: successResponse.data!)
                 Success(responseModel)
             }
             catch {
                 print("Response Error")
             }
             
             
         } , Falioure: {(Error) in
             Failure(Error)
         })
      }
    
    
    
    class  func getCurrentPkgs(Success: @escaping (CurrentPkgModel) -> Void, Failure: @escaping(NetworkError) -> Void){
           let url = Constant.MainUrl + Constant.URLs.currentpkg
           print("pages Url", url)
           Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

               do {
                print(successResponse)
                   let responseModel = try JSONDecoder().decode(CurrentPkgModel.self, from: successResponse.data!)
                   Success(responseModel)
               }
               catch {
                   print("Response Error")
               }


           } , Falioure: {(Error) in
               Failure(Error)
           })
       }
    
    
    
    class  func forgotPassword(params:[String:Any],Success: @escaping (ForgotPasswordModel) -> Void, Failure: @escaping(NetworkError) -> Void){
          let url = Constant.MainUrl + Constant.URLs.forgotpassword
          print("pages Url", url)
          
          
          print("Parameter Data ", params)
          Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                     
             do {
               print(successResponse)
                 let responseModel = try JSONDecoder().decode(ForgotPasswordModel.self, from: successResponse.data!)
                 Success(responseModel)
             }
             catch {
                 print("Response Error")
             }
             
             
         } , Falioure: {(Error) in
             Failure(Error)
         })
      }
    
    
    class  func codeVeriFy(params:[String:Any],Success: @escaping (VerifyCodeModel) -> Void, Failure: @escaping(NetworkError) -> Void){
             let url = Constant.MainUrl + Constant.URLs.veryfiycode
             print("pages Url", url)
             
             
             print("Parameter Data ", params)
             Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                        
                do {
                  print(successResponse)
                    let responseModel = try JSONDecoder().decode(VerifyCodeModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
                
                
            } , Falioure: {(Error) in
                Failure(Error)
            })
         }
    
    
    
    class  func resetPassword(params:[String:Any],Success: @escaping (VerifyCodeModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.resetPassword
        print("pages Url", url)
        
        
        print("Parameter Data ", params)
        Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                   
           do {
             print(successResponse)
               let responseModel = try JSONDecoder().decode(VerifyCodeModel.self, from: successResponse.data!)
               Success(responseModel)
           }
           catch {
               print("Response Error")
           }
           
           
       } , Falioure: {(Error) in
           Failure(Error)
       })
    }
    
    
    class  func changePassword(params:[String:Any],Success: @escaping (VerifyCodeModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.ChangePassword
        print("pages Url", url)
        
        
        print("Parameter Data ", params)
        Networkhandler.PostRequest(url: url, parameters: params, success: {(successResponse) in
                   
           do {
             print(successResponse)
               let responseModel = try JSONDecoder().decode(VerifyCodeModel.self, from: successResponse.data!)
               Success(responseModel)
           }
           catch {
               print("Response Error")
           }
           
           
       } , Falioure: {(Error) in
           Failure(Error)
       })
    }
    
    
    
}
