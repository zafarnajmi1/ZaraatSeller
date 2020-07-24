//
//  AddGalleryModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct AddGallery : Codable {
    let message : String?
    let success : Int?
    let status : Int?
    let image_paths : [String]?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case success = "success"
        case status = "status"
        case image_paths = "image_paths"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        image_paths = try values.decodeIfPresent([String].self, forKey: .image_paths)
    }

}
