//
//  VariationAttributeModel.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/7/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
class VariationModel : Codable {
    var message : String?
    var attributs : [Attributs]?
    var status : Int?
    var success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case attributs = "attributs"
        case status = "status"
        case success = "success"
    }

    required init(from decoder: Decoder) throws {
        let  values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        attributs = try values.decodeIfPresent([Attributs].self, forKey: .attributs)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}
class Attributs : Codable {
    var attribute_id : Int?
    var attribute_title : String?
    var status : Int?
    var created_at : String?
    var updated_at : String?
    var attribute_values : [Attribute_values]?
    var isSelected :Bool? =  false
    enum CodingKeys: String, CodingKey {

        case attribute_id = "attribute_id"
        case attribute_title = "attribute_title"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case attribute_values = "attribute_values"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        attribute_id = try values.decodeIfPresent(Int.self, forKey: .attribute_id)
        attribute_title = try values.decodeIfPresent(String.self, forKey: .attribute_title)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        attribute_values = try values.decodeIfPresent([Attribute_values].self, forKey: .attribute_values)
    }

}
class Attribute_values : Codable {
    var attribute_id : Int?
   var  attribute_values_id : Int?
    var attribute_values : String?
    var created_at : String?
    var updated_at : String?
    var selected : Bool? = false
    enum CodingKeys: String, CodingKey {

        case attribute_id = "attribute_id"
        case attribute_values_id = "attribute_values_id"
        case attribute_values = "attribute_values"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        attribute_id = try values.decodeIfPresent(Int.self, forKey: .attribute_id)
        attribute_values_id = try values.decodeIfPresent(Int.self, forKey: .attribute_values_id)
        attribute_values = try values.decodeIfPresent(String.self, forKey: .attribute_values)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
