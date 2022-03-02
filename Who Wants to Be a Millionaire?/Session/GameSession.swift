//
//  GameSession.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 01.03.2022.
//

import Foundation

class GameSession: GameActionDelegate {
    var allQuestions: Int
    private var trueAnswer: Int = 0
    private var score: Int = 0
    private var cullFriend: Bool = true
    private var hallHelp: Bool = true
    private var fifty: Bool = true
    
    lazy var isWinner: Bool = {
        allQuestions > 0 && allQuestions == trueAnswer
    }()
    
    init(question: Int) {
        allQuestions = question
    }
    
    func currentScoreGameSessin(scoreDelegate: Int) {
        trueAnswer += 1
        score += scoreDelegate
    }
    
    func getTrueAnswer() -> Int{
        trueAnswer
    }
    func getScore() -> Int{
        score
    }
}
