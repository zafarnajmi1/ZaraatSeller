//
//  StateModel.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 07/05/2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct StateModel : Codable {
    let message : String?
    let success : Int?
    let status : Int?
    let states : [StatesStates]?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case success = "success"
        case status = "status"
        case states = "states"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        states = try values.decodeIfPresent([StatesStates].self, forKey: .states)
    }

}
struct StatesStates : Codable {
    let id : Int?
    let name : String?
    let country_id : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case country_id = "country_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        country_id = try values.decodeIfPresent(Int.self, forKey: .country_id)
    }

}
