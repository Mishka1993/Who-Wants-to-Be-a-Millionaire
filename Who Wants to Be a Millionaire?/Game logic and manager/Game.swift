//
//  Game.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 01.03.2022.
//

import Foundation

final class Game {
    static let shared = Game()
    var gameSession: GameSession?
    private var gameResults = [GameResult]()
    var gameMode = Difficulty.stat
    
    private init() {}
    
    func gameOver(){
        guard let gameSession = gameSession else { return }
        gameResults.append(
            GameResult(allQuestion: gameSession.allQuestions,
                       trueAnswer: gameSession.getTrueAnswer(),
                       allScore: gameSession.getScore(),
                       isWinner: gameSession.isWinner,
                       trueAnswerPercent: getPct())
        )
        
        self.gameSession = nil
    }
    func getPct() -> Double {
        guard let gameSession = gameSession else { return 0.0 }
        return (Double(gameSession.getTrueAnswer()) / Double(gameSession.allQuestions)) * 100
    }
    func getAllGameResults() -> [GameResult] {
        return gameResults
    }
    
    func setAllGameResults(resulsts: [GameResult]) {
        gameResults = resulsts
    }
}
extension Game: NSCopying {
    func copy(with _: NSZone? = nil) -> Any {
        return self
    }
}
