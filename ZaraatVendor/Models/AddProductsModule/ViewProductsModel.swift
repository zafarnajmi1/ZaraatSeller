//
//  ViewProducts.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/18/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct ViewProductsModel : Codable {
   let product : Product?
       let features : Features?
       let gallery : [Gallery]?
       let category : Category?
       let subcategory : Subcategory?
       let child_subcategory : Child_subcategory?
       let variation : Variation?
       let message : String?
       let status : Int?
       let code : Int?

       enum CodingKeys: String, CodingKey {

           case product = "product"
           case features = "features"
           case gallery = "gallery"
           case category = "category"
           case subcategory = "subcategory"
           case child_subcategory = "child_subcategory"
           case variation = "variation"
           case message = "message"
           case status = "status"
           case code = "code"
       }

       init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
           product = try values.decodeIfPresent(Product.self, forKey: .product)
           features = try values.decodeIfPresent(Features.self, forKey: .features)
           gallery = try values.decodeIfPresent([Gallery].self, forKey: .gallery)
           category = try values.decodeIfPresent(Category.self, forKey: .category)
           subcategory = try values.decodeIfPresent(Subcategory.self, forKey: .subcategory)
           child_subcategory = try values.decodeIfPresent(Child_subcategory.self, forKey: .child_subcategory)
           variation = try values.decodeIfPresent(Variation.self, forKey: .variation)
           message = try values.decodeIfPresent(String.self, forKey: .message)
           status = try values.decodeIfPresent(Int.self, forKey: .status)
           code = try values.decodeIfPresent(Int.self, forKey: .code)
       }

   }


struct Features : Codable {
    
        let feature_id : Int?
        let product_id : Int?
        let feature_title_en : String?
        let feature_title_urdu : String?
        let feature_desc_en : String?
        let feature_desc_urdu : String?
        let feature_status : Int?
        let created_at : String?
        let updated_at : String?

        enum CodingKeys: String, CodingKey {

            case feature_id = "feature_id"
            case product_id = "product_id"
            case feature_title_en = "feature_title_en"
            case feature_title_urdu = "feature_title_urdu"
            case feature_desc_en = "feature_desc_en"
            case feature_desc_urdu = "feature_desc_urdu"
            case feature_status = "feature_status"
            case created_at = "created_at"
            case updated_at = "updated_at"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            feature_id = try values.decodeIfPresent(Int.self, forKey: .feature_id)
            product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
            feature_title_en = try values.decodeIfPresent(String.self, forKey: .feature_title_en)
            feature_title_urdu = try values.decodeIfPresent(String.self, forKey: .feature_title_urdu)
            feature_desc_en = try values.decodeIfPresent(String.self, forKey: .feature_desc_en)
            feature_desc_urdu = try values.decodeIfPresent(String.self, forKey: .feature_desc_urdu)
            feature_status = try values.decodeIfPresent(Int.self, forKey: .feature_status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        }

    }

struct Product : Codable {
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
        }

    }


struct Gallery : Codable {
   let gallery_id : Int?
        let product_id : Int?
        let file_path : String?
        let file_status : Int?
        let created_at : String?
        let updated_at : String?

        enum CodingKeys: String, CodingKey {

            case gallery_id = "gallery_id"
            case product_id = "product_id"
            case file_path = "file_path"
            case file_status = "file_status"
            case created_at = "created_at"
            case updated_at = "updated_at"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            gallery_id = try values.decodeIfPresent(Int.self, forKey: .gallery_id)
            product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
            file_path = try values.decodeIfPresent(String.self, forKey: .file_path)
            file_status = try values.decodeIfPresent(Int.self, forKey: .file_status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        }

    }



struct Category : Codable {
  let categories_id : Int?
       let market : String?
       let category_title_en : String?
       let category_title_urdu : String?
       let category_image : String?
       let category_description_en : String?
       let category_description_urdu : String?
       let status : Int?
       let created_at : String?
       let updated_at : String?

       enum CodingKeys: String, CodingKey {

           case categories_id = "categories_id"
           case market = "market"
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
           categories_id = try values.decodeIfPresent(Int.self, forKey: .categories_id)
           market = try values.decodeIfPresent(String.self, forKey: .market)
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


struct Subcategory : Codable {
    let subcategory_id : Int?
        let category_id : Int?
        let subcategory_title_en : String?
        let subcategory_title_urdu : String?
        let subcategory_description_en : String?
        let subcategory_description_urdu : String?
        let commission : String?
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
            case commission = "commission"
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
            commission = try values.decodeIfPresent(String.self, forKey: .commission)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        }

    }



struct Child_subcategory : Codable {
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

struct ViewProductsVariation : Codable {
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
    }

    init(from decoder: Decoder) throws {
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
    }

}
