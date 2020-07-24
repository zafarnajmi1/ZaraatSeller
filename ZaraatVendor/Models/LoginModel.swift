//
//  LoginModel.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 29/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct LoginModel : Codable {
               
       let errors : Errors?
       let token : String?
       let vendors : LoginVendors?
       let token_type : String?
       let expires_in : String?
       let message : String?
       let success : Int?
       let status : Int?

       enum CodingKeys: String, CodingKey {

           case errors = "errors"
           case token = "token"
           case vendors = "vendors"
           case token_type = "token_type"
           case expires_in = "expires_in"
           case message = "message"
           case success = "success"
           case status = "status"
       }

       init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
           errors = try values.decodeIfPresent(Errors.self, forKey: .errors)
           token = try values.decodeIfPresent(String.self, forKey: .token)
           vendors = try values.decodeIfPresent(LoginVendors.self, forKey: .vendors)
           token_type = try values.decodeIfPresent(String.self, forKey: .token_type)
           expires_in = try values.decodeIfPresent(String.self, forKey: .expires_in)
           message = try values.decodeIfPresent(String.self, forKey: .message)
           success = try values.decodeIfPresent(Int.self, forKey: .success)
           status = try values.decodeIfPresent(Int.self, forKey: .status)
       }

    }
struct LoginVendors : Codable {
    let market : String?
    let vendor_type : String?
    let company_name : String?
    let business_type : String?
    let owners_name : String?
    let email : String?
    let bussiness_email : String?
    let password : String?
    let phone : String?
    let description : String?
    let description_urdu : String?
    let address : String?
    let zipcode : String?
    let package_id : Int?
    let country_id : Int?
    let state_id : Int?
    let city_id : Int?
    let question_id : Int?
    let security_answer : String?
    let logo : String?
    let status : Int?
    let updated_at : String?
    let created_at : String?
    let vendor_id : Int?
    
    enum CodingKeys: String, CodingKey {

        case market = "market"
        case vendor_type = "vendor_type"
        case company_name = "company_name"
        case business_type = "business_type"
        case owners_name = "owners_name"
        case email = "email"
        case bussiness_email = "bussiness_email"
        case password = "password"
        case phone = "phone"
        case description = "description"
        case description_urdu = "description_urdu"
        case address = "address"
        case zipcode = "zipcode"
        case package_id = "package_id"
        case country_id = "country_id"
        case state_id = "state_id"
        case city_id = "city_id"
        case question_id = "question_id"
        case security_answer = "security_answer"
        case logo = "logo"
        case status = "status"
        case updated_at = "updated_at"
        case created_at = "created_at"
        case vendor_id = "vendor_id"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        vendor_type = try values.decodeIfPresent(String.self, forKey: .vendor_type)
        company_name = try values.decodeIfPresent(String.self, forKey: .company_name)
        business_type = try values.decodeIfPresent(String.self, forKey: .business_type)
        owners_name = try values.decodeIfPresent(String.self, forKey: .owners_name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        bussiness_email = try values.decodeIfPresent(String.self, forKey: .bussiness_email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        description_urdu = try values.decodeIfPresent(String.self, forKey: .description_urdu)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
        package_id = try values.decodeIfPresent(Int.self, forKey: .package_id)
        country_id = try values.decodeIfPresent(Int.self, forKey: .country_id)
        state_id = try values.decodeIfPresent(Int.self, forKey: .state_id)
        city_id = try values.decodeIfPresent(Int.self, forKey: .city_id)
        question_id = try values.decodeIfPresent(Int.self, forKey: .question_id)
        security_answer = try values.decodeIfPresent(String.self, forKey: .security_answer)
        logo = try values.decodeIfPresent(String.self, forKey: .logo)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        
    }

}


//struct LoginVendors : Codable {
//    let vendor_id : Int?
//    let company_name : String?
//    let owners_name : String?
//    let business_type : String?
//    let email : String?
//    let password : String?
//    let phone : String?
//    let bussiness_email : String?
//    let description : String?
//    let description_urdu : String?
//    let address : String?
//    let zipcode : String?
//    let country_id : Int?
//    let state_id : Int?
//    let city_id : Int?
//    let vendor_category_id : Int?
//    let vendor_subcategory_id : Int?
//    let vendor_child_id : Int?
//    let package_id : Int?
//    let logo : String?
//    let question_id : Int?
//    let security_answer : String?
//    let status : Int?
//    let created_at : String?
//    let updated_at : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case vendor_id = "vendor_id"
//        case company_name = "company_name"
//        case owners_name = "owners_name"
//        case business_type = "business_type"
//        case email = "email"
//        case password = "password"
//        case phone = "phone"
//        case bussiness_email = "bussiness_email"
//        case description = "description"
//        case description_urdu = "description_urdu"
//        case address = "address"
//        case zipcode = "zipcode"
//        case country_id = "country_id"
//        case state_id = "state_id"
//        case city_id = "city_id"
//        case vendor_category_id = "vendor_category_id"
//        case vendor_subcategory_id = "vendor_subcategory_id"
//        case vendor_child_id = "vendor_child_id"
//        case package_id = "package_id"
//        case logo = "logo"
//        case question_id = "question_id"
//        case security_answer = "security_answer"
//        case status = "status"
//        case created_at = "created_at"
//        case updated_at = "updated_at"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
//        company_name = try values.decodeIfPresent(String.self, forKey: .company_name)
//        owners_name = try values.decodeIfPresent(String.self, forKey: .owners_name)
//        business_type = try values.decodeIfPresent(String.self, forKey: .business_type)
//        email = try values.decodeIfPresent(String.self, forKey: .email)
//        password = try values.decodeIfPresent(String.self, forKey: .password)
//        phone = try values.decodeIfPresent(String.self, forKey: .phone)
//        bussiness_email = try values.decodeIfPresent(String.self, forKey: .bussiness_email)
//        description = try values.decodeIfPresent(String.self, forKey: .description)
//        description_urdu = try values.decodeIfPresent(String.self, forKey: .description_urdu)
//        address = try values.decodeIfPresent(String.self, forKey: .address)
//        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
//        country_id = try values.decodeIfPresent(Int.self, forKey: .country_id)
//        state_id = try values.decodeIfPresent(Int.self, forKey: .state_id)
//        city_id = try values.decodeIfPresent(Int.self, forKey: .city_id)
//        vendor_category_id = try values.decodeIfPresent(Int.self, forKey: .vendor_category_id)
//        vendor_subcategory_id = try values.decodeIfPresent(Int.self, forKey: .vendor_subcategory_id)
//        vendor_child_id = try values.decodeIfPresent(Int.self, forKey: .vendor_child_id)
//        package_id = try values.decodeIfPresent(Int.self, forKey: .package_id)
//        logo = try values.decodeIfPresent(String.self, forKey: .logo)
//        question_id = try values.decodeIfPresent(Int.self, forKey: .question_id)
//        security_answer = try values.decodeIfPresent(String.self, forKey: .security_answer)
//        status = try values.decodeIfPresent(Int.self, forKey: .status)
//        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
//        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
//    }
//
//}

struct Errors : Codable {

    enum CodingKeys:  CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}


class PostParams {
    var params : [String : Any] = [:]
    var id: String?
    var features : [Int] = []
}

class VariationParams {
    var params : [String : [Int]] = [:]
    
}
