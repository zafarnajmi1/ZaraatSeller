//
//  VariationDetailModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
class VariationDetailModel : Codable {
    let message : String?
    let variation : Variation?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case variation = "variation"
        case success = "success"
        case status = "status"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        variation = try values.decodeIfPresent(Variation.self, forKey: .variation)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
class Variation : Codable {
    let variation_id : Int?
    let product_id : Int?
    let variation_title_en : String?
    let variation_title_urdu : String?
    let variation_description_en : String?
    let variation_description_urdu : String?
    let variation_price : String?
    let vendor_price : String?
    let variation_stock : String?
    let created_at : String?
    let updated_at : String?
    let attributes : [Attributes]?

    enum CodingKeys: String, CodingKey {

        case variation_id = "variation_id"
        case product_id = "product_id"
        case variation_title_en = "variation_title_en"
        case variation_title_urdu = "variation_title_urdu"
        case variation_description_en = "variation_description_en"
        case variation_description_urdu = "variation_description_urdu"
        case variation_price = "variation_price"
        case vendor_price = "vendor_price"
        case variation_stock = "variation_stock"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case attributes = "attributes"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        variation_id = try values.decodeIfPresent(Int.self, forKey: .variation_id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        variation_title_en = try values.decodeIfPresent(String.self, forKey: .variation_title_en)
        variation_title_urdu = try values.decodeIfPresent(String.self, forKey: .variation_title_urdu)
        variation_description_en = try values.decodeIfPresent(String.self, forKey: .variation_description_en)
        variation_description_urdu = try values.decodeIfPresent(String.self, forKey: .variation_description_urdu)
        variation_price = try values.decodeIfPresent(String.self, forKey: .variation_price)
        vendor_price = try values.decodeIfPresent(String.self, forKey: .vendor_price)
        variation_stock = try values.decodeIfPresent(String.self, forKey: .variation_stock)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        attributes = try values.decodeIfPresent([Attributes].self, forKey: .attributes)
    }

}
class Attributes : Codable {
    let variaton_attribute_id : Int?
    let variation_id : Int?
    let attribute_id : Int?
    let created_at : String?
    let updated_at : String?
    let attribute_title : Attribute_title?
    var isSelected : Bool? = false
    let vals : [Vals]?

    enum CodingKeys: String, CodingKey {

        case variaton_attribute_id = "variaton_attribute_id"
        case variation_id = "variation_id"
        case attribute_id = "attribute_id"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case attribute_title = "attribute_title"
        case vals = "vals"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        variaton_attribute_id = try values.decodeIfPresent(Int.self, forKey: .variaton_attribute_id)
        variation_id = try values.decodeIfPresent(Int.self, forKey: .variation_id)
        attribute_id = try values.decodeIfPresent(Int.self, forKey: .attribute_id)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        attribute_title = try values.decodeIfPresent(Attribute_title.self, forKey: .attribute_title)
        vals = try values.decodeIfPresent([Vals].self, forKey: .vals)
    }

}
class Vals : Codable {
    let variation_attribute_id : Int?
    let attribute_values_id : Int?
    let created_at : String?
    let updated_at : String?
    let attribute_values : Attribute_values?

    enum CodingKeys: String, CodingKey {

        case variation_attribute_id = "variation_attribute_id"
        case attribute_values_id = "attribute_values_id"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case attribute_values = "attribute_values"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        variation_attribute_id = try values.decodeIfPresent(Int.self, forKey: .variation_attribute_id)
        attribute_values_id = try values.decodeIfPresent(Int.self, forKey: .attribute_values_id)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        attribute_values = try values.decodeIfPresent(Attribute_values.self, forKey: .attribute_values)
    }

}
//class Attribute_values : Codable {
//    let attribute_values_id : Int?
//    let attribute_id : Int?
//    let attribute_values : String?
//    let created_at : String?
//    let updated_at : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case attribute_values_id = "attribute_values_id"
//        case attribute_id = "attribute_id"
//        case attribute_values = "attribute_values"
//        case created_at = "created_at"
//        case updated_at = "updated_at"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        attribute_values_id = try values.decodeIfPresent(Int.self, forKey: .attribute_values_id)
//        attribute_id = try values.decodeIfPresent(Int.self, forKey: .attribute_id)
//        attribute_values = try values.decodeIfPresent(String.self, forKey: .attribute_values)
//        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
//        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
//    }
//
//}
class Attribute_title : Codable {
    let attribute_id : Int?
    let attribute_title : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case attribute_id = "attribute_id"
        case attribute_title = "attribute_title"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        attribute_id = try values.decodeIfPresent(Int.self, forKey: .attribute_id)
        attribute_title = try values.decodeIfPresent(String.self, forKey: .attribute_title)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
