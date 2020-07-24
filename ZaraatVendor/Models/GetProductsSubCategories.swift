//
//  GetProductsSubCategories.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 5/14/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct GetProductsSubCategories : Codable {
    let errors : Errors?
    let message : String?
    let subcategories : [Subcategories]?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case errors = "errors"
        case message = "message"
        case subcategories = "subcategories"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decodeIfPresent(Errors.self, forKey: .errors)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        subcategories = try values.decodeIfPresent([Subcategories].self, forKey: .subcategories)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}

struct Subcategories : Codable {
    let category_id : Int?
    let product_subcategory_id : Int?
    let subcategory_title_en : String?

    enum CodingKeys: String, CodingKey {

        case category_id = "category_id"
        case product_subcategory_id = "product_subcategory_id"
        case subcategory_title_en = "subcategory_title_en"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        product_subcategory_id = try values.decodeIfPresent(Int.self, forKey: .product_subcategory_id)
        subcategory_title_en = try values.decodeIfPresent(String.self, forKey: .subcategory_title_en)
    }

}
