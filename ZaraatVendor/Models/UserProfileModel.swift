//
//  UserProfileModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 6/4/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct UserProfile : Codable {
    let errors : Errors?
    let message : String?
    let vendors : UserProfileVendors?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case errors = "errors"
        case message = "message"
        case vendors = "vendors"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decodeIfPresent(Errors.self, forKey: .errors)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        vendors = try values.decodeIfPresent(UserProfileVendors.self, forKey: .vendors)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
struct UserProfileVendors : Codable {
    let email : String?
        let logo : String?
        let password : String?
        let owners_name : String?
        let phone : String?

        enum CodingKeys: String, CodingKey {

            case email = "email"
            case logo = "logo"
            case password = "password"
            case owners_name = "owners_name"
            case phone = "phone"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            logo = try values.decodeIfPresent(String.self, forKey: .logo)
            password = try values.decodeIfPresent(String.self, forKey: .password)
            owners_name = try values.decodeIfPresent(String.self, forKey: .owners_name)
            phone = try values.decodeIfPresent(String.self, forKey: .phone)
        }

    }
