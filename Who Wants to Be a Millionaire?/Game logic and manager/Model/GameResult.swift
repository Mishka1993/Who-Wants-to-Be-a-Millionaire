//
//  GameResult.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 02.03.2022.
//

import Foundation

struct GameResult: Codable {
    var allQuestion: Int
    var trueAnswer: Int
    var allScore: Int
    var isWinner: Bool
}
