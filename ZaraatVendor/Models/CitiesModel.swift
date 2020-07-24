//
//  CitiesModel.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 07/05/2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct CitiesModel : Codable {
    let message : String?
        let success : Int?
        let status : Int?
        let cities : [Cities]?

        enum CodingKeys: String, CodingKey {

            case message = "message"
            case success = "success"
            case status = "status"
            case cities = "cities"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            success = try values.decodeIfPresent(Int.self, forKey: .success)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            cities = try values.decodeIfPresent([Cities].self, forKey: .cities)
        }

    }

//struct States : Codable {
//    let id : Int?
//    let name : String?
//    let state_id : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//        case state_id = "state_id"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        state_id = try values.decodeIfPresent(Int.self, forKey: .state_id)
//    }
//
//}
struct Cities : Codable {
    let id : Int?
    let name : String?
    let state_id : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case state_id = "state_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        state_id = try values.decodeIfPresent(Int.self, forKey: .state_id)
    }

}
