//
//  QuestionsModel.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 07/05/2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct QuestionsModel : Codable {
    let message : String?
    let success : Int?
    let status : Int?
    let question : [Question]?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case success = "success"
        case status = "status"
        case question = "question"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        question = try values.decodeIfPresent([Question].self, forKey: .question)
    }

}

struct Question : Codable {
    let question_id : Int?
    let question : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case question_id = "question_id"
        case question = "question"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        question_id = try values.decodeIfPresent(Int.self, forKey: .question_id)
        question = try values.decodeIfPresent(String.self, forKey: .question)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
