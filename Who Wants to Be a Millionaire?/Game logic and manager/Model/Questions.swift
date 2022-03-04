//
//  Questions.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 01.03.2022.
//

import Foundation

struct QuestionItem {
    let question: String
    let answer: [Answer]
    let help: HelpStr
}

struct Answer {
    let option: String
    var score: Int
    var isRight: Bool {
        score > 0
    }
}

struct HelpStr {
    let cullFriend: String
    let hallHelp: String
}

let questions = [QuestionItem(question: "2+2",
                              answer: [Answer(option: "3", score: 0),
                                       Answer(option: "3", score: 0),
                                       Answer(option: "4", score: 1000),
                                       Answer(option: "3", score: 0)],
                              help: HelpStr(cullFriend: "", hallHelp: "")),
                 QuestionItem(question: "2+1",
                              answer: [Answer(option: "3", score: 1000),
                                       Answer(option: "3", score: 0),
                                       Answer(option: "4", score: 0),
                                       Answer(option: "3", score: 0)],
                              help: HelpStr(cullFriend: "", hallHelp: ""))]



