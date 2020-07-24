//
//  CountriesModel.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 07/05/2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct CountiresModel : Codable {
    let message : String?
    let success : Int?
    let status : Int?
    let countries : [Countries]?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case success = "success"
        case status = "status"
        case countries = "countries"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        countries = try values.decodeIfPresent([Countries].self, forKey: .countries)
    }

}
struct Countries : Codable {
    let id : Int?
    let sortname : String?
    let name : String?
    let phonecode : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case sortname = "sortname"
        case name = "name"
        case phonecode = "phonecode"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        sortname = try values.decodeIfPresent(String.self, forKey: .sortname)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        phonecode = try values.decodeIfPresent(Int.self, forKey: .phonecode)
    }

}
