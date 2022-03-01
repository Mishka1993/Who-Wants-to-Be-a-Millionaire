//
//  Questions.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 01.03.2022.
//

import Foundation

struct QuestionItem {
    let question: String
    let option1: String
    let option2: String
    let option3: String
    let option4: String
    let trueAnswer: Int
    let help: HelpStr
}

struct Question{
    let questions = [QuestionItem(question: "2+2", option1: "3", option2: "6", option3: "4", option4: "1", trueAnswer: 2, help: HelpStr(cullFriend: "", hallHelp: ""))]
}

struct HelpStr {
    let cullFriend: String
    let hallHelp: String
    
    init(cullFriend: String, hallHelp: String){
        self.cullFriend = cullFriend
        self.hallHelp = hallHelp
    }
}
