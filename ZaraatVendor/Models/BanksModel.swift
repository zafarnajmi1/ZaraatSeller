//
//  BanksModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 5/19/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

struct BanksModel : Codable {
    let errors : Errors?
    let message : String?
    let banks : [Banks]?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case errors = "errors"
        case message = "message"
        case banks = "banks"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decodeIfPresent(Errors.self, forKey: .errors)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        banks = try values.decodeIfPresent([Banks].self, forKey: .banks)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}

struct Banks : Codable {
    let bank_id : Int?
    let bank_name : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case bank_id = "bank_id"
        case bank_name = "bank_name"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bank_id = try values.decodeIfPresent(Int.self, forKey: .bank_id)
        bank_name = try values.decodeIfPresent(String.self, forKey: .bank_name)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
