//
//  UploadDocument.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 07/05/2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct DocumentUpload : Codable {
    let errors : Errors?
        let message : String?
        let path : String?
        let success : Int?
        let status : Int?

        enum CodingKeys: String, CodingKey {

            case errors = "errors"
            case message = "message"
            case path = "path"
            case success = "success"
            case status = "status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            errors = try values.decodeIfPresent(Errors.self, forKey: .errors)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            path = try values.decodeIfPresent(String.self, forKey: .path)
            success = try values.decodeIfPresent(Int.self, forKey: .success)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
        }

    }



