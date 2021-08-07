//
//  InquiresModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 1/27/21.
//  Copyright © 2021 User. All rights reserved.
//

import Foundation
struct Myinquires : Codable {
    let message : String?
    let enquiries : [Enquiries]?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case enquiries = "enquiries"
        case status = "status"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        enquiries = try values.decodeIfPresent([Enquiries].self, forKey: .enquiries)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}

struct Enquiries : Codable {
    let enquiry_id : Int?
    let vendor_id : Int?
    let customer_id : Int?
    let product_id : Int?
    let message : String?
    let document : String?
    let status : Int?
    let reply : String?
    let created_at : String?
    let updated_at : String?
    let customer : Customer?
    let product : Productinquires?

    enum CodingKeys: String, CodingKey {

        case enquiry_id = "enquiry_id"
        case vendor_id = "vendor_id"
        case customer_id = "customer_id"
        case product_id = "product_id"
        case message = "message"
        case document = "document"
        case status = "status"
        case reply = "reply"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case customer = "customer"
        case product = "product"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        enquiry_id = try values.decodeIfPresent(Int.self, forKey: .enquiry_id)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        document = try values.decodeIfPresent(String.self, forKey: .document)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        reply = try values.decodeIfPresent(String.self, forKey: .reply)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        customer = try values.decodeIfPresent(Customer.self, forKey: .customer)
        product = try values.decodeIfPresent(Productinquires.self, forKey: .product)
    }

}

struct Productinquires : Codable {
    let products_id : Int?
    let vendor_id : Int?
    let category_id : Int?
    let subcategory_id : Int?
    let child_subcategory_id : Int?
    let product_title_en : String?
    let product_title_urdu : String?
    let product_description_en : String?
    let product_description_urdu : String?
    let product_type : String?
    let product_stock : String?
    let stock_threshold : String?
    let vendor_price : String?
    let selling_price : String?
    let product_length : String?
    let product_width : String?
    let product_weight : String?
    let product_height : String?
    let product_supply_ability : String?
    let product_sku : String?
    let product_barcode : String?
    let product_status : String?
    let featured_image : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case products_id = "products_id"
        case vendor_id = "vendor_id"
        case category_id = "category_id"
        case subcategory_id = "subcategory_id"
        case child_subcategory_id = "child_subcategory_id"
        case product_title_en = "product_title_en"
        case product_title_urdu = "product_title_urdu"
        case product_description_en = "product_description_en"
        case product_description_urdu = "product_description_urdu"
        case product_type = "product_type"
        case product_stock = "product_stock"
        case stock_threshold = "stock_threshold"
        case vendor_price = "vendor_price"
        case selling_price = "selling_price"
        case product_length = "product_length"
        case product_width = "product_width"
        case product_weight = "product_weight"
        case product_height = "product_height"
        case product_supply_ability = "product_supply_ability"
        case product_sku = "product_sku"
        case product_barcode = "product_barcode"
        case product_status = "product_status"
        case featured_image = "featured_image"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products_id = try values.decodeIfPresent(Int.self, forKey: .products_id)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        child_subcategory_id = try values.decodeIfPresent(Int.self, forKey: .child_subcategory_id)
        product_title_en = try values.decodeIfPresent(String.self, forKey: .product_title_en)
        product_title_urdu = try values.decodeIfPresent(String.self, forKey: .product_title_urdu)
        product_description_en = try values.decodeIfPresent(String.self, forKey: .product_description_en)
        product_description_urdu = try values.decodeIfPresent(String.self, forKey: .product_description_urdu)
        product_type = try values.decodeIfPresent(String.self, forKey: .product_type)
        product_stock = try values.decodeIfPresent(String.self, forKey: .product_stock)
        stock_threshold = try values.decodeIfPresent(String.self, forKey: .stock_threshold)
        vendor_price = try values.decodeIfPresent(String.self, forKey: .vendor_price)
        selling_price = try values.decodeIfPresent(String.self, forKey: .selling_price)
        product_length = try values.decodeIfPresent(String.self, forKey: .product_length)
        product_width = try values.decodeIfPresent(String.self, forKey: .product_width)
        product_weight = try values.decodeIfPresent(String.self, forKey: .product_weight)
        product_height = try values.decodeIfPresent(String.self, forKey: .product_height)
        product_supply_ability = try values.decodeIfPresent(String.self, forKey: .product_supply_ability)
        product_sku = try values.decodeIfPresent(String.self, forKey: .product_sku)
        product_barcode = try values.decodeIfPresent(String.self, forKey: .product_barcode)
        product_status = try values.decodeIfPresent(String.self, forKey: .product_status)
        featured_image = try values.decodeIfPresent(String.self, forKey: .featured_image)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct Customer : Codable {
    let customer_id : Int?
    let first_name : String?
    let last_name : String?
    let email : String?
    let provider_id : String?
    let provider : String?
    let phone : String?
    let password : String?
    let gender : String?
    let picture : String?
    let status : Int?
    let fcm_token : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case customer_id = "customer_id"
        case first_name = "first_name"
        case last_name = "last_name"
        case email = "email"
        case provider_id = "provider_id"
        case provider = "provider"
        case phone = "phone"
        case password = "password"
        case gender = "gender"
        case picture = "picture"
        case status = "status"
        case fcm_token = "fcm_token"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        provider_id = try values.decodeIfPresent(String.self, forKey: .provider_id)
        provider = try values.decodeIfPresent(String.self, forKey: .provider)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        fcm_token = try values.decodeIfPresent(String.self, forKey: .fcm_token)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
