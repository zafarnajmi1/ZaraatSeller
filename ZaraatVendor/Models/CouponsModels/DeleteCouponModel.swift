//
//  DeleteCouponModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/3/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct DeleteCouponModel : Codable {
    let message : String?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
