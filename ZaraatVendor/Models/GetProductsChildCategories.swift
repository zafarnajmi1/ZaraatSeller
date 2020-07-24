//
//  GetProductsChildCategories.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 5/14/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct GetProductsChildCategories : Codable {
    let errors : Errors?
    let message : String?
    let childsubcategories : [Childsubcategories]?
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
        childsubcategories = try values.decodeIfPresent([Childsubcategories].self, forKey: .childsubcategories)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}

struct Childsubcategories : Codable {
    let product_subcategory_child_id : Int?
    let product_subcategory_title_en : String?

    enum CodingKeys: String, CodingKey {

        case product_subcategory_child_id = "product_subcategory_child_id"
        case product_subcategory_title_en = "product_subcategory_title_en"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        product_subcategory_child_id = try values.decodeIfPresent(Int.self, forKey: .product_subcategory_child_id)
        product_subcategory_title_en = try values.decodeIfPresent(String.self, forKey: .product_subcategory_title_en)
    }

}
