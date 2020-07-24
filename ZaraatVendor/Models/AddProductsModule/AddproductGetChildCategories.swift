//
//  AddproductGetChildCategories.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct AddproductGetChildCategories : Codable {
    let errors : Errors?
    let message : String?
    let childsubcategories : [AddproductGetChildsubcategories]?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case errors = "errors"
        case message = "message"
        case childsubcategories = "childsubcategories"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decodeIfPresent(Errors.self, forKey: .errors)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        childsubcategories = try values.decodeIfPresent([AddproductGetChildsubcategories].self, forKey: .childsubcategories)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}

struct AddproductGetChildsubcategories : Codable {
   let child_categories_id : Int?
        let vendor_subcategory_id : Int?
        let child_subcategory_title_en : String?

        enum CodingKeys: String, CodingKey {

            case child_categories_id = "child_categories_id"
            case vendor_subcategory_id = "vendor_subcategory_id"
            case child_subcategory_title_en = "child_subcategory_title_en"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            child_categories_id = try values.decodeIfPresent(Int.self, forKey: .child_categories_id)
            vendor_subcategory_id = try values.decodeIfPresent(Int.self, forKey: .vendor_subcategory_id)
            child_subcategory_title_en = try values.decodeIfPresent(String.self, forKey: .child_subcategory_title_en)
        }

    }
