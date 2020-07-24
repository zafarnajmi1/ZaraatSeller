//
//  UploadDealImage.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct uploadDealImage : Codable {
    let message : String?
    let avater : String?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case avater = "avater"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        avater = try values.decodeIfPresent(String.self, forKey: .avater)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
