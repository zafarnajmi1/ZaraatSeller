//
//  ForgotPasswordModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/20/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct ForgotPasswordModel : Codable {
    let message : String?
    let user : ForgotPasswordUser?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case user = "user"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user = try values.decodeIfPresent(ForgotPasswordUser.self, forKey: .user)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
struct ForgotPasswordUser : Codable {
    let vendor_id : Int?
    let market : String?
    let vendor_type : String?
    let company_name : String?
    let owners_name : String?
    let business_type : String?
    let email : String?
    let password : String?
    let phone : String?
    let business_phone : String?
    let bussiness_email : String?
    let description : String?
    let description_urdu : String?
    let address : String?
    let vendor_longitude : String?
    let vendor_latitude : String?
    let package_id : Int?
    let logo : String?
    let question_id : Int?
    let security_answer : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case vendor_id = "vendor_id"
        case market = "market"
        case vendor_type = "vendor_type"
        case company_name = "company_name"
        case owners_name = "owners_name"
        case business_type = "business_type"
        case email = "email"
        case password = "password"
        case phone = "phone"
        case business_phone = "business_phone"
        case bussiness_email = "bussiness_email"
        case description = "description"
        case description_urdu = "description_urdu"
        case address = "address"
        case vendor_longitude = "vendor_longitude"
        case vendor_latitude = "vendor_latitude"
        case package_id = "package_id"
        case logo = "logo"
        case question_id = "question_id"
        case security_answer = "security_answer"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        vendor_type = try values.decodeIfPresent(String.self, forKey: .vendor_type)
        company_name = try values.decodeIfPresent(String.self, forKey: .company_name)
        owners_name = try values.decodeIfPresent(String.self, forKey: .owners_name)
        business_type = try values.decodeIfPresent(String.self, forKey: .business_type)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        business_phone = try values.decodeIfPresent(String.self, forKey: .business_phone)
        bussiness_email = try values.decodeIfPresent(String.self, forKey: .bussiness_email)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        description_urdu = try values.decodeIfPresent(String.self, forKey: .description_urdu)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        vendor_longitude = try values.decodeIfPresent(String.self, forKey: .vendor_longitude)
        vendor_latitude = try values.decodeIfPresent(String.self, forKey: .vendor_latitude)
        package_id = try values.decodeIfPresent(Int.self, forKey: .package_id)
        logo = try values.decodeIfPresent(String.self, forKey: .logo)
        question_id = try values.decodeIfPresent(Int.self, forKey: .question_id)
        security_answer = try values.decodeIfPresent(String.self, forKey: .security_answer)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
