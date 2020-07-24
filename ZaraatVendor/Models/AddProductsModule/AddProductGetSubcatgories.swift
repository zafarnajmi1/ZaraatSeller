//
//  AddProductGetSubcatgories.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/8/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct AddProductGetSubcatgories : Codable {
    let errors : Errors?
    let message : String?
    let subcategories : [AddProductGetSubcatgoriesSubcategories]?
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
        subcategories = try values.decodeIfPresent([AddProductGetSubcatgoriesSubcategories].self, forKey: .subcategories)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}

struct AddProductGetSubcatgoriesSubcategories : Codable {
   let subcategory_id : Int?
    let subcategory_title_en : String?
    let commission : String?

    enum CodingKeys: String, CodingKey {

        case subcategory_id = "subcategory_id"
        case subcategory_title_en = "subcategory_title_en"
        case commission = "commission"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        subcategory_title_en = try values.decodeIfPresent(String.self, forKey: .subcategory_title_en)
        commission = try values.decodeIfPresent(String.self, forKey: .commission)
    }

}
