//
//  CurrentPkgModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/20/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct CurrentPkgModel : Codable {
    let message : String?
    let my_package : CurrentMy_package?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case my_package = "my_package"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        my_package = try values.decodeIfPresent(CurrentMy_package.self, forKey: .my_package)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
struct CurrentMy_package : Codable {
    let package_id : Int?
    let showcase_products : String?
    let sub_accounts : String?
    let account_validity : String?
    let package_name : String?
    let price : String?
    let ads_number : Int?
    let conference_workshop : Int?
    let inquiries : Int?
    let reporting : Int?
    let verification : Int?
    let marketing : Int?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case package_id = "package_id"
        case showcase_products = "showcase_products"
        case sub_accounts = "sub_accounts"
        case account_validity = "account_validity"
        case package_name = "package_name"
        case price = "price"
        case ads_number = "ads_number"
        case conference_workshop = "conference_workshop"
        case inquiries = "inquiries"
        case reporting = "reporting"
        case verification = "verification"
        case marketing = "marketing"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        package_id = try values.decodeIfPresent(Int.self, forKey: .package_id)
        showcase_products = try values.decodeIfPresent(String.self, forKey: .showcase_products)
        sub_accounts = try values.decodeIfPresent(String.self, forKey: .sub_accounts)
        account_validity = try values.decodeIfPresent(String.self, forKey: .account_validity)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        ads_number = try values.decodeIfPresent(Int.self, forKey: .ads_number)
        conference_workshop = try values.decodeIfPresent(Int.self, forKey: .conference_workshop)
        inquiries = try values.decodeIfPresent(Int.self, forKey: .inquiries)
        reporting = try values.decodeIfPresent(Int.self, forKey: .reporting)
        verification = try values.decodeIfPresent(Int.self, forKey: .verification)
        marketing = try values.decodeIfPresent(Int.self, forKey: .marketing)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
