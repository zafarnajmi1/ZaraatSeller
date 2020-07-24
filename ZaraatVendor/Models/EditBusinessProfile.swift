//
//  EditBusinessProfile.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 5/19/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct EditBusinessProfile : Codable {
   let message : String?
        let vendors : EditBusinessProfileVendors?
        let categories : [EditBusinessProfileCategories]?
        let success : Int?
        let status : Int?

        enum CodingKeys: String, CodingKey {

            case message = "message"
            case vendors = "vendors"
            case categories = "categories"
            case success = "success"
            case status = "status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            vendors = try values.decodeIfPresent(EditBusinessProfileVendors.self, forKey: .vendors)
            categories = try values.decodeIfPresent([EditBusinessProfileCategories].self, forKey: .categories)
            success = try values.decodeIfPresent(Int.self, forKey: .success)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
        }

    }

struct EditBusinessProfileVendors : Codable {
    let question_id : Int?
        let question : String?
        let package_name : String?
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
        let security_answer : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let vendor_account_title : String?
        let vendor_account_number : String?
        let vendor_bank_name : String?
        let vendor_branch_code : String?
        let bank_status : Int?
        let billing_person_name : String?
        let billing_address : String?
        let billing_zipcode : String?
        let billing_longitude : String?
        let billing_latitude : String?
        let billing_status : Int?
        let legal_name : String?
        let business_registration_num : String?
        let business_document : String?
        let business_status : Int?
        let shipping_person_name : String?
        let shipping_address : String?
        let shipping_zipcode : String?
        let shipping_longitude : String?
        let shipping_latitude : String?
        let shipping_status : Int?
        let bank_id : Int?
        enum CodingKeys: String, CodingKey {

            case question_id = "question_id"
            case question = "question"
            case package_name = "package_name"
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
            case security_answer = "security_answer"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case vendor_account_title = "vendor_account_title"
            case vendor_account_number = "vendor_account_number"
            case vendor_bank_name = "vendor_bank_name"
            case vendor_branch_code = "vendor_branch_code"
            case bank_status = "bank_status"
            case billing_person_name = "billing_person_name"
            case billing_address = "billing_address"
            case billing_zipcode = "billing_zipcode"
            case billing_longitude = "billing_longitude"
            case billing_latitude = "billing_latitude"
            case billing_status = "billing_status"
            case legal_name = "legal_name"
            case business_registration_num = "business_registration_num"
            case business_document = "business_document"
            case business_status = "business_status"
            case shipping_person_name = "shipping_person_name"
            case shipping_address = "shipping_address"
            case shipping_zipcode = "shipping_zipcode"
            case shipping_longitude = "shipping_longitude"
            case shipping_latitude = "shipping_latitude"
            case shipping_status = "shipping_status"
            case bank_id = "bank_id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            question_id = try values.decodeIfPresent(Int.self, forKey: .question_id)
            question = try values.decodeIfPresent(String.self, forKey: .question)
            package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
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
            security_answer = try values.decodeIfPresent(String.self, forKey: .security_answer)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            vendor_account_title = try values.decodeIfPresent(String.self, forKey: .vendor_account_title)
            vendor_account_number = try values.decodeIfPresent(String.self, forKey: .vendor_account_number)
            vendor_bank_name = try values.decodeIfPresent(String.self, forKey: .vendor_bank_name)
            vendor_branch_code = try values.decodeIfPresent(String.self, forKey: .vendor_branch_code)
            bank_status = try values.decodeIfPresent(Int.self, forKey: .bank_status)
            billing_person_name = try values.decodeIfPresent(String.self, forKey: .billing_person_name)
            billing_address = try values.decodeIfPresent(String.self, forKey: .billing_address)
            billing_zipcode = try values.decodeIfPresent(String.self, forKey: .billing_zipcode)
            billing_longitude = try values.decodeIfPresent(String.self, forKey: .billing_longitude)
            billing_latitude = try values.decodeIfPresent(String.self, forKey: .billing_latitude)
            billing_status = try values.decodeIfPresent(Int.self, forKey: .billing_status)
            legal_name = try values.decodeIfPresent(String.self, forKey: .legal_name)
            business_registration_num = try values.decodeIfPresent(String.self, forKey: .business_registration_num)
            business_document = try values.decodeIfPresent(String.self, forKey: .business_document)
            business_status = try values.decodeIfPresent(Int.self, forKey: .business_status)
            shipping_person_name = try values.decodeIfPresent(String.self, forKey: .shipping_person_name)
            shipping_address = try values.decodeIfPresent(String.self, forKey: .shipping_address)
            shipping_zipcode = try values.decodeIfPresent(String.self, forKey: .shipping_zipcode)
            shipping_longitude = try values.decodeIfPresent(String.self, forKey: .shipping_longitude)
            shipping_latitude = try values.decodeIfPresent(String.self, forKey: .shipping_latitude)
            shipping_status = try values.decodeIfPresent(Int.self, forKey: .shipping_status)
            bank_id = try values.decodeIfPresent(Int.self, forKey: .bank_id)
        }

    }
struct EditBusinessProfileCategories : Codable {
    let categories_id : Int?
    let category_title_en : String?

    enum CodingKeys: String, CodingKey {

        case categories_id = "categories_id"
        case category_title_en = "category_title_en"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories_id = try values.decodeIfPresent(Int.self, forKey: .categories_id)
        category_title_en = try values.decodeIfPresent(String.self, forKey: .category_title_en)
    }

}
