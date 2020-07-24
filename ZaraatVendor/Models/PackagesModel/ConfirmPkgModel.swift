//
//  ConfirmPkgModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/20/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct ConfirmPkgModel : Codable {
    let message : String?
    let package : ConfirmPackage?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case package = "package"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        package = try values.decodeIfPresent(ConfirmPackage.self, forKey: .package)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
struct ConfirmPackage : Codable {
    let vendor_id : Int?
//    let package_id : String?
//    let payment_method : String?
//    let transaction_id : String?
//    let description : String?
    let picture : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case vendor_id = "vendor_id"
//        case package_id = "package_id"
//        case payment_method = "payment_method"
//        case transaction_id = "transaction_id"
//        case description = "description"
        case picture = "picture"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
//        package_id = try values.decodeIfPresent(String.self, forKey: .package_id)
//        payment_method = try values.decodeIfPresent(String.self, forKey: .payment_method)
//        transaction_id = try values.decodeIfPresent(String.self, forKey: .transaction_id)
//        description = try values.decodeIfPresent(String.self, forKey: .description)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
