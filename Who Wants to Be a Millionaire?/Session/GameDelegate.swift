//
//  GameDelegate.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 02.03.2022.
//

import Foundation

protocol GameActionDelegate: AnyObject {
    var allQuestions: Int {get set}
    func currentScoreGameSessin(scoreDelegate: Int)
    func getTrueAnswer() -> Int
    func getScore() -> Int
}

