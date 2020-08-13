//
//  CreateDealModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct CreateDealModel : Codable {
    let message : String?
        let success : Int?
        let deal : Deal?
        let status : Int?

        enum CodingKeys: String, CodingKey {

            case message = "message"
            case success = "success"
            case deal = "deal"
            case status = "status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            success = try values.decodeIfPresent(Int.self, forKey: .success)
            deal = try values.decodeIfPresent(Deal.self, forKey: .deal)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
        }

    }

struct Deal : Codable {
    let user_id : Int?
        let deal_title_en : String?
        let deal_title_urdu : String?
        let deal_desc_en : String?
//        let deal_desc_urdu : String?
//        let deal_price : String?
//        let deal_start_date : String?
//        let deal_end_date : String?
//        let deal_image : String?
//        let deal_video : String?
//        let deal_status : String?
//        let updated_at : String?
//        let created_at : String?
//        let deals_id : Int?

        enum CodingKeys: String, CodingKey {

            case user_id = "user_id"
            case deal_title_en = "deal_title_en"
            case deal_title_urdu = "deal_title_urdu"
            case deal_desc_en = "deal_desc_en"
//            case deal_desc_urdu = "deal_desc_urdu"
//            case deal_price = "deal_price"
//            case deal_start_date = "deal_start_date"
//            case deal_end_date = "deal_end_date"
//            case deal_image = "deal_image"
//            case deal_video = "deal_video"
//            case deal_status = "deal_status"
//            case updated_at = "updated_at"
//            case created_at = "created_at"
//            case deals_id = "deals_id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
            deal_title_en = try values.decodeIfPresent(String.self, forKey: .deal_title_en)
            deal_title_urdu = try values.decodeIfPresent(String.self, forKey: .deal_title_urdu)
            deal_desc_en = try values.decodeIfPresent(String.self, forKey: .deal_desc_en)
//            deal_desc_urdu = try values.decodeIfPresent(String.self, forKey: .deal_desc_urdu)
//            deal_price = try values.decodeIfPresent(String.self, forKey: .deal_price)
//            deal_start_date = try values.decodeIfPresent(String.self, forKey: .deal_start_date)
//            deal_end_date = try values.decodeIfPresent(String.self, forKey: .deal_end_date)
//            deal_image = try values.decodeIfPresent(String.self, forKey: .deal_image)
//            deal_video = try values.decodeIfPresent(String.self, forKey: .deal_video)
//            deal_status = try values.decodeIfPresent(String.self, forKey: .deal_status)
//            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
//            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
//            deals_id = try values.decodeIfPresent(Int.self, forKey: .deals_id)
        }

    }
