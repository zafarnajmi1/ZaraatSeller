//
//  ChildCategory.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 06/05/2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct ChildCategory : Codable {
    let success : Int?
        let vendorchildsubcategories : [Vendorchildsubcategories]?
        let package : [Package]?
        let data : Int?
        let message : String?
        let status : Int?

        enum CodingKeys: String, CodingKey {

            case success = "success"
            case vendorchildsubcategories = "vendorchildsubcategories"
            case package = "package"
            case data = "data"
            case message = "message"
            case status = "status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            success = try values.decodeIfPresent(Int.self, forKey: .success)
            vendorchildsubcategories = try values.decodeIfPresent([Vendorchildsubcategories].self, forKey: .vendorchildsubcategories)
            package = try values.decodeIfPresent([Package].self, forKey: .package)
            data = try values.decodeIfPresent(Int.self, forKey: .data)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
        }

    }


struct Vendorchildsubcategories : Codable {
    let child_categories_id : Int?
    let vendor_category_id : Int?
    let vendor_subcategory_id : Int?
    let child_subcategory_title_en : String?
    let child_subcategory_title_urdu : String?
    let child_subcategory_desc_en : String?
    let child_subcategory_desc_urdu : String?
    let image : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case child_categories_id = "child_categories_id"
        case vendor_category_id = "vendor_category_id"
        case vendor_subcategory_id = "vendor_subcategory_id"
        case child_subcategory_title_en = "child_subcategory_title_en"
        case child_subcategory_title_urdu = "child_subcategory_title_urdu"
        case child_subcategory_desc_en = "child_subcategory_desc_en"
        case child_subcategory_desc_urdu = "child_subcategory_desc_urdu"
        case image = "image"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        child_categories_id = try values.decodeIfPresent(Int.self, forKey: .child_categories_id)
        vendor_category_id = try values.decodeIfPresent(Int.self, forKey: .vendor_category_id)
        vendor_subcategory_id = try values.decodeIfPresent(Int.self, forKey: .vendor_subcategory_id)
        child_subcategory_title_en = try values.decodeIfPresent(String.self, forKey: .child_subcategory_title_en)
        child_subcategory_title_urdu = try values.decodeIfPresent(String.self, forKey: .child_subcategory_title_urdu)
        child_subcategory_desc_en = try values.decodeIfPresent(String.self, forKey: .child_subcategory_desc_en)
        child_subcategory_desc_urdu = try values.decodeIfPresent(String.self, forKey: .child_subcategory_desc_urdu)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
