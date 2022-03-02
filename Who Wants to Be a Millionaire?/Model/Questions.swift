//
//  Questions.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 01.03.2022.
//

import Foundation

struct QuestionItem {
    let question: String
    let option0: String
    let option1: String
    let option2: String
    let option3: String
    let trueAnswer: Int
    let help: HelpStr
}

struct HelpStr {
    let cullFriend: String
    let hallHelp: String
}

struct GameResult: Codable {
    var allQuestion: Int
    var trueAnswer: Int
    var allScore: Int
    var isWinner: Bool

}

struct Question{
    let questions = [QuestionItem(question: "2+2",
                                  option0: "3",
                                  option1: "6",
                                  option2: "4",
                                  option3: "1",
                                  trueAnswer: 2,
                                  help: HelpStr(cullFriend: "", hallHelp: "")),
                     QuestionItem(question: "2+2",
                                  option0: "3",
                                  option1: "6",
                                  option2: "4",
                                  option3: "1",
                                  trueAnswer: 2,
                                  help: HelpStr(cullFriend: "", hallHelp: ""))]
}


