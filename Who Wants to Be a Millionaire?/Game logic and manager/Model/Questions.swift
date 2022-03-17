//
//  Questions.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 01.03.2022.
//

import Foundation

struct QuestionItem: Codable {
    let question: String
    let answer: [Answer]
}

struct Answer: Codable {
    let option: String
    var score: Int
    var isRight: Bool {
        score > 0
    }
}
