//
//  GetProductsModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 5/14/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct GetProducts : Codable {
   let errors : Errors?
        let message : String?
        let products : [Products]?
        let success : Int?
        let status : Int?

        enum CodingKeys: String, CodingKey {

            case errors = "errors"
            case message = "message"
            case products = "products"
            case success = "success"
            case status = "status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            errors = try values.decodeIfPresent(Errors.self, forKey: .errors)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            products = try values.decodeIfPresent([Products].self, forKey: .products)
            success = try values.decodeIfPresent(Int.self, forKey: .success)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
        }

    }


struct Products : Codable {
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
        let images : [Images]?

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
            case images = "images"
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
            images = try values.decodeIfPresent([Images].self, forKey: .images)
        }

    }
//struct Images : Codable {
//    let gallery_id : Int?
//    let product_id : Int?
//    let file_path : String?
//    let file_status : Int?
//    let created_at : String?
//    let updated_at : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case gallery_id = "gallery_id"
//        case product_id = "product_id"
//        case file_path = "file_path"
//        case file_status = "file_status"
//        case created_at = "created_at"
//        case updated_at = "updated_at"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        gallery_id = try values.decodeIfPresent(Int.self, forKey: .gallery_id)
//        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
//        file_path = try values.decodeIfPresent(String.self, forKey: .file_path)
//        file_status = try values.decodeIfPresent(Int.self, forKey: .file_status)
//        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
//        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
//    }
//
//}
