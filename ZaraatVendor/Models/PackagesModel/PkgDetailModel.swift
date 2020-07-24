//
//  PkgDetailModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/20/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct PkgDetailModel : Codable {
   let my_package : My_package?
        let user : User?
        let transection_id : String?
        let billing_address : Billing_address?

        enum CodingKeys: String, CodingKey {

            case my_package = "my_package"
            case user = "user"
            case transection_id = "transection_id"
            case billing_address = "billing_address"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            my_package = try values.decodeIfPresent(My_package.self, forKey: .my_package)
            user = try values.decodeIfPresent(User.self, forKey: .user)
            transection_id = try values.decodeIfPresent(String.self, forKey: .transection_id)
            billing_address = try values.decodeIfPresent(Billing_address.self, forKey: .billing_address)
        }

    }


    struct Billing_address : Codable {
        let address : String?
        let mobile : String?
        let email : String?

        enum CodingKeys: String, CodingKey {

            case address = "address"
            case mobile = "mobile"
            case email = "email"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            address = try values.decodeIfPresent(String.self, forKey: .address)
            mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
            email = try values.decodeIfPresent(String.self, forKey: .email)
        }

    }
struct My_package : Codable {
    let package_id : Int?
    let showcase_products : String?
    let sub_accounts : String?
    let account_validity : String?
    let package_name : String?
    let price : String?
    let ads_number : Int?
    let conference_workshop : Int?
    let inquiries : Int?
    let reporting : Int?
    let verification : Int?
    let marketing : Int?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case package_id = "package_id"
        case showcase_products = "showcase_products"
        case sub_accounts = "sub_accounts"
        case account_validity = "account_validity"
        case package_name = "package_name"
        case price = "price"
        case ads_number = "ads_number"
        case conference_workshop = "conference_workshop"
        case inquiries = "inquiries"
        case reporting = "reporting"
        case verification = "verification"
        case marketing = "marketing"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        package_id = try values.decodeIfPresent(Int.self, forKey: .package_id)
        showcase_products = try values.decodeIfPresent(String.self, forKey: .showcase_products)
        sub_accounts = try values.decodeIfPresent(String.self, forKey: .sub_accounts)
        account_validity = try values.decodeIfPresent(String.self, forKey: .account_validity)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        ads_number = try values.decodeIfPresent(Int.self, forKey: .ads_number)
        conference_workshop = try values.decodeIfPresent(Int.self, forKey: .conference_workshop)
        inquiries = try values.decodeIfPresent(Int.self, forKey: .inquiries)
        reporting = try values.decodeIfPresent(Int.self, forKey: .reporting)
        verification = try values.decodeIfPresent(Int.self, forKey: .verification)
        marketing = try values.decodeIfPresent(Int.self, forKey: .marketing)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct User : Codable {
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
