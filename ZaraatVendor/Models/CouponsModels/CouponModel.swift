//
//  CouponModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct CouponModel : Codable {
   let message : String?
        let coupon : Coupon?
        let success : Int?
        let status : Int?

        enum CodingKeys: String, CodingKey {

            case message = "message"
            case coupon = "coupon"
            case success = "success"
            case status = "status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            coupon = try values.decodeIfPresent(Coupon.self, forKey: .coupon)
            success = try values.decodeIfPresent(Int.self, forKey: .success)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
        }

    }

struct Coupon : Codable {
    let user_id : Int?
    let coupon_tittle : String?
    let coupon_code : String?
    let coupon_value : String?
    let coupon_value_type : String?
    let start_date : String?
    let end_date : String?
    let status : Int?
    let updated_at : String?
    let created_at : String?
    let coupon_id : Int?

    enum CodingKeys: String, CodingKey {

        case user_id = "user_id"
        case coupon_tittle = "coupon_tittle"
        case coupon_code = "coupon_code"
        case coupon_value = "coupon_value"
          case coupon_value_type = "coupon_value_type"
        case start_date = "start_date"
        case end_date = "end_date"
          case status = "status"
        case updated_at = "updated_at"
        case created_at = "created_at"
        case coupon_id = "coupon_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        coupon_tittle = try values.decodeIfPresent(String.self, forKey: .coupon_tittle)
         coupon_code = try values.decodeIfPresent(String.self, forKey: .coupon_code)
        coupon_value = try values.decodeIfPresent(String.self, forKey: .coupon_value)
        coupon_value_type = try values.decodeIfPresent(String.self, forKey: .coupon_value_type)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        coupon_id = try values.decodeIfPresent(Int.self, forKey: .coupon_id)
    }

}
