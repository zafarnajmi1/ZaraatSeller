//
//  SubCategoryModel.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 06/05/2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct SubCategoryModel : Codable {
    let success : Int?
        let vendorsubcategories : [Vendorsubcategories]?
        let package : [Package]?
        let data : Int?
        let message : String?
        let status : Int?

        enum CodingKeys: String, CodingKey {

            case success = "success"
            case vendorsubcategories = "vendorsubcategories"
            case package = "package"
            case data = "data"
            case message = "message"
            case status = "status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            success = try values.decodeIfPresent(Int.self, forKey: .success)
            vendorsubcategories = try values.decodeIfPresent([Vendorsubcategories].self, forKey: .vendorsubcategories)
            package = try values.decodeIfPresent([Package].self, forKey: .package)
            data = try values.decodeIfPresent(Int.self, forKey: .data)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
        }

    }



struct Vendorsubcategories : Codable {
    let subcategory_id : Int?
    let category_id : Int?
    let subcategory_title_en : String?
    let subcategory_title_urdu : String?
    let subcategory_description_en : String?
    let subcategory_description_urdu : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case subcategory_id = "subcategory_id"
        case category_id = "category_id"
        case subcategory_title_en = "subcategory_title_en"
        case subcategory_title_urdu = "subcategory_title_urdu"
        case subcategory_description_en = "subcategory_description_en"
        case subcategory_description_urdu = "subcategory_description_urdu"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        subcategory_title_en = try values.decodeIfPresent(String.self, forKey: .subcategory_title_en)
        subcategory_title_urdu = try values.decodeIfPresent(String.self, forKey: .subcategory_title_urdu)
        subcategory_description_en = try values.decodeIfPresent(String.self, forKey: .subcategory_description_en)
        subcategory_description_urdu = try values.decodeIfPresent(String.self, forKey: .subcategory_description_urdu)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}


struct Package : Codable {
    let package_id : Int?
    let category_id : Int?
    let subcategory_id : Int?
    let child_categories_id : Int?
    let package_name : String?
    let price : String?
    let ads_number : Int?
    let commission : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case package_id = "package_id"
        case category_id = "category_id"
        case subcategory_id = "subcategory_id"
        case child_categories_id = "child_categories_id"
        case package_name = "package_name"
        case price = "price"
        case ads_number = "ads_number"
        case commission = "commission"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        package_id = try values.decodeIfPresent(Int.self, forKey: .package_id)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        child_categories_id = try values.decodeIfPresent(Int.self, forKey: .child_categories_id)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        ads_number = try values.decodeIfPresent(Int.self, forKey: .ads_number)
        commission = try values.decodeIfPresent(String.self, forKey: .commission)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
