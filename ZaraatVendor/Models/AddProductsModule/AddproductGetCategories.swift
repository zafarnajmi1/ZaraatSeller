//
//  AddProductModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 5/13/20.
//  Copyright © 2020 User. All rights reserved.
//


struct AddproductGetCategories : Codable {
    let errors : Errors?
    let message : String?
    let categories : [AddGetCategories]?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case errors = "errors"
        case message = "message"
        case categories = "categories"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decodeIfPresent(Errors.self, forKey: .errors)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        categories = try values.decodeIfPresent([AddGetCategories].self, forKey: .categories)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}

struct AddGetCategories : Codable {
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
