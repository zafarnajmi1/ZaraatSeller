//
//  GetSinglCouponModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/3/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct GetSingleCouponModel : Codable {
    let coupon : GetSingleCouponModelCoupon?
    let message : String?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case coupon = "coupon"
        case message = "message"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coupon = try values.decodeIfPresent(GetSingleCouponModelCoupon.self, forKey: .coupon)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
struct GetSingleCouponModelCoupon : Codable {
    let coupon_id : Int?
    let user_id : Int?
    let coupon_tittle : String?
    let coupon_code : String?
    let coupon_value : String?
    let coupon_value_type : String?
    let start_date : String?
    let end_date : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case coupon_id = "coupon_id"
        case user_id = "user_id"
        case coupon_tittle = "coupon_tittle"
        case coupon_code = "coupon_code"
        case coupon_value = "coupon_value"
        case coupon_value_type = "coupon_value_type"
        case start_date = "start_date"
        case end_date = "end_date"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coupon_id = try values.decodeIfPresent(Int.self, forKey: .coupon_id)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        coupon_tittle = try values.decodeIfPresent(String.self, forKey: .coupon_tittle)
        coupon_code = try values.decodeIfPresent(String.self, forKey: .coupon_code)
        coupon_value = try values.decodeIfPresent(String.self, forKey: .coupon_value)
        coupon_value_type = try values.decodeIfPresent(String.self, forKey: .coupon_value_type)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
