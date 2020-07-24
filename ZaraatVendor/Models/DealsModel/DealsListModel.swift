//
//  DealsListModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/3/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct DealsListModel : Codable {
    let message : String?
    let deals : [Deals]?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case deals = "deals"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        deals = try values.decodeIfPresent([Deals].self, forKey: .deals)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
struct Deals : Codable {
    let deals_id : Int?
    let user_id : Int?
    let deal_title_en : String?
    let deal_title_urdu : String?
    let deal_desc_en : String?
    let deal_desc_urdu : String?
    let deal_price : String?
    let deal_start_date : String?
    let deal_end_date : String?
    let deal_image : String?
    let deal_video : String?
    let deal_status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case deals_id = "deals_id"
        case user_id = "user_id"
        case deal_title_en = "deal_title_en"
        case deal_title_urdu = "deal_title_urdu"
        case deal_desc_en = "deal_desc_en"
        case deal_desc_urdu = "deal_desc_urdu"
        case deal_price = "deal_price"
        case deal_start_date = "deal_start_date"
        case deal_end_date = "deal_end_date"
        case deal_image = "deal_image"
        case deal_video = "deal_video"
        case deal_status = "deal_status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        deals_id = try values.decodeIfPresent(Int.self, forKey: .deals_id)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        deal_title_en = try values.decodeIfPresent(String.self, forKey: .deal_title_en)
        deal_title_urdu = try values.decodeIfPresent(String.self, forKey: .deal_title_urdu)
        deal_desc_en = try values.decodeIfPresent(String.self, forKey: .deal_desc_en)
        deal_desc_urdu = try values.decodeIfPresent(String.self, forKey: .deal_desc_urdu)
        deal_price = try values.decodeIfPresent(String.self, forKey: .deal_price)
        deal_start_date = try values.decodeIfPresent(String.self, forKey: .deal_start_date)
        deal_end_date = try values.decodeIfPresent(String.self, forKey: .deal_end_date)
        deal_image = try values.decodeIfPresent(String.self, forKey: .deal_image)
        deal_video = try values.decodeIfPresent(String.self, forKey: .deal_video)
        deal_status = try values.decodeIfPresent(Int.self, forKey: .deal_status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
