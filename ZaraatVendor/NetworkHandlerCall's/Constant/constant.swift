//
//  constant.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class Constant {
    
    
    struct instgramUrls {
        static let clientId = "1a50df5f7e4a413b88059ece6c3de03f" //"c09e8026cf0f4335a2fa978ebfa7871e"
        static let redirectUri = "https://www.projects.mytechnology.ae/car-insurance/"//"https://www.projects.mytechnology.ae/car-insurance/en/api/"
       
        static let clientScret = "54786ef7ce44467ba81408c1a9adf89d"
        static let  authorization = "https://api.instagram.com/oauth/authorize/"
        static let scope = "likes+comments+relationships"
    }
   
    static var MainUrl : String {
        return "https://apiengine.zaraat.com/api/vendors/"
       
        // "http://dev.nsols.pk/public/api/vendors/"
    }
    
    
    struct activitySize {
        static let size = CGSize(width: 40, height: 40)
    }
    
    enum loaderMessages : String {
        case loadingMessage = "Loading..."
    }
    
    //AuthPArt
    struct URLs {
        
        static let Register = "register"
        static let Login = "login"
        static let categories = "categories"
        static let pkgCates = "categories/types/"
        static let childCates = "categories/types/childs/"
        static let Questions = "http://apiengine.zaraat.com/api/security/question"
        static let cities = "cities/"
        static let state = "states/"
        static let countries = "countries"
        static let Profile = "profile"
        static let document = "document"
        static let LogOut = "logout"
        static let BankList = "banks"
        static let editBusinessProfile = "edit/profile"
        static let AddProduct = "products/store"
        static let getProducts = "products"
        static let ChildProducts = "products/categories/subcategories/children/"
        static let SubProducts = "/products/categories/subcategories/"
        static let CategoriProducts = "products/categories"
        static let userProfileGet = "edit/main/profile"
        static let updateprofilePost = "update/main/profile"
        static let addProductCategories = "products/categories"
        static let  addproductGetSubCategories = "products/categories/subcategories/"
        static let addProductGetChildCategories = "products/categories/subcategories/children/"
        static let addGalleryimages = "products/gallery"
        static let ViewProduct = "products/show/"
        static let updateProduct = "products/update/"
        static let deleteImg = "products/gallery/delete/"
        static let DeletePrduct = "products/delete/"
        static let CreateDeal = "deals/store"
        static let dealimgUpload = "deals/image/upload"
        static let dealVideoUpload = "deals/video/upload"
        
        
        static let CreateCoupon = "coupons/store"
        static let getCoupon = "coupons/get"
        static let getSingleCoupon = "coupons/get/single/"
        static let updateCoupon = "coupons/update"
        static let deleteCoupon = "coupons/delete"
        
        
        static let saleDetail = "sales/get/single/"
        static let saleList = "sales/get"
        static let saleCreate = "sales/store"
        static let updateSale = "sales/update"
        static let deleteSale = "sales/delete"
        
        
        static let DealList = "deals/get"
        static let DealDelete = "deals/delete"
        static let DealDetail = "deals/get/single/"
        static let  DealUpdate = "deals/update"
        static let DealSingleItemDelete = "deals/item/delete"
        
        static let Attributes  = "products/attributes"
        static let addvariation = "products/variations"
        static let addfeatures = "products/features"
        
        static let VariationDetail = "products/variations/"
        static let VariationDelete = "products/variations/delete"
        static let FeaturesDelete = "products/features/delete"
        static let pkgs = "packages"
        static let pkgdetail = "packages/bill/"
        static let addReceipt = "packages/upload/picture"
        static let confrimPkg = "packages/confirm"
        static let currentpkg = "packages/current"
        static let forgotpassword = "resetpassword/request"
        static let veryfiycode = "verify"
        static let resetPassword = "resetpassword"
        
        static let ChangePassword = "edit/main/profile/changepassword"
    }
    
    struct NetworkErrorType {
        static let timeOutInterval: TimeInterval = 20
        
        static let error = "Error"
        static let internetNotAvailable = "Internet Not Available. Please Try Again"
        static let pleaseTryAgain = "Please Try Again"
        
        static let generic = 4000
        static let genericError = "Please Try Again."
        
        static let serverErrorCode = 5000
        static let serverNotAvailable = "Server Not Available"
        static let serverError = "Server Not Availabe, Please Try Later."
        
        static let timout = 4001
        static let timoutError = "Network Time Out, Please Try Again."
        
        static let login = 4003
        static let loginMessage = "Unable To Login"
        static let loginError = "Please Try Again."
        
        static let internet = 4004
        static let internetError = "Internet Not Available. Please Try Again"
    }
    
    struct NetworkSuccess {
        static let statusOK = 200
    }
    
}

let NOTIFICATIONS_UPDATED = "NOTIFICATIONS_UPDATED"
