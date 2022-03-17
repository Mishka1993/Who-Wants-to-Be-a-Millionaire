//
//  GameSession.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 01.03.2022.
//

import Foundation

protocol GameActionDelegate {
    var allQuestions: Int {get set}
    func currentScoreGameSessin(scoreDelegate: Int)
}

class GameSession: GameActionDelegate {
    var allQuestions: Int
    let trueAnswer = Observable<Int>(0)
    private var score: Int = 0
    
    lazy var isWinner: Bool = {
        allQuestions > 0 && allQuestions == trueAnswer.value
    }()
    
    init(question: Int) {
        allQuestions = question
    }
    
    convenience init() {
        self.init(question: 0)
    }
    
    func currentScoreGameSessin(scoreDelegate: Int) {
        trueAnswer.value += 1
        score += scoreDelegate
    }
    
    func getTrueAnswer() -> Int{
        trueAnswer.value
    }
    func getScore() -> Int{
        score
    }
}
