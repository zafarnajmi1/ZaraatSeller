//
//  UpdateSaleModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/6/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct UpdateSaleModel : Codable {
    let message : String?
    let sale : UpdateSale?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case sale = "sale"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        sale = try values.decodeIfPresent(UpdateSale.self, forKey: .sale)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
struct UpdateSale : Codable {
    let onsale_id : Int?
//    let product_id : String?
//    let user_id : Int?
//    let vendor_id : Int?
//    let actual_price : String?
//    let discount_percent : String?
//    let sale_price : String?
//    let start_date : String?
//    let end_date : String?
//    let status : String?
//    let created_at : String?
//    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case onsale_id = "onsale_id"
//        case product_id = "product_id"
//        case user_id = "user_id"
//        case vendor_id = "vendor_id"
//        case actual_price = "actual_price"
//        case discount_percent = "discount_percent"
//        case sale_price = "sale_price"
//        case start_date = "start_date"
//        case end_date = "end_date"
//        case status = "status"
//        case created_at = "created_at"
//        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        onsale_id = try values.decodeIfPresent(Int.self, forKey: .onsale_id)
//        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
//        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
//        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
//        actual_price = try values.decodeIfPresent(String.self, forKey: .actual_price)
//        discount_percent = try values.decodeIfPresent(String.self, forKey: .discount_percent)
//        sale_price = try values.decodeIfPresent(String.self, forKey: .sale_price)
//        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
//        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
//        status = try values.decodeIfPresent(String.self, forKey: .status)
//        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
//        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
