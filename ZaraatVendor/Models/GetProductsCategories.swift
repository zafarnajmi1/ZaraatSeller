//
//  GetProductsCategories.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 5/14/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct GetProductsCategoris : Codable {
    let errors : Errors?
    let message : String?
    let categories : [Categories]?
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
        categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}

struct Categories : Codable {
    let category_id : Int?
    let category_title_en : String?
    let category_title_urdu : String?
    let category_image : String?
    let category_description_en : String?
    let category_description_urdu : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case category_id = "category_id"
        case category_title_en = "category_title_en"
        case category_title_urdu = "category_title_urdu"
        case category_image = "category_image"
        case category_description_en = "category_description_en"
        case category_description_urdu = "category_description_urdu"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        category_title_en = try values.decodeIfPresent(String.self, forKey: .category_title_en)
        category_title_urdu = try values.decodeIfPresent(String.self, forKey: .category_title_urdu)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_description_en = try values.decodeIfPresent(String.self, forKey: .category_description_en)
        category_description_urdu = try values.decodeIfPresent(String.self, forKey: .category_description_urdu)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
