//
//  BusinesProfileModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 5/11/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct BusinesProfileModel : Codable {
    let errors : Errors?
        let success : Int?
        let message : String?
        let status : String?

        enum CodingKeys: String, CodingKey {

            case errors = "errors"
            case success = "success"
            case message = "message"
            case status = "status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            errors = try values.decodeIfPresent(Errors.self, forKey: .errors)
            success = try values.decodeIfPresent(Int.self, forKey: .success)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            status = try values.decodeIfPresent(String.self, forKey: .status)
        }

    }
