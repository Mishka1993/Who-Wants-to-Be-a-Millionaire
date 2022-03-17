//
//  GameStrategy.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 16.03.2022.
//

import Foundation

protocol DisplayQuestionStrategy {
    func displayQuestion() -> QuestionItem?
}

enum Difficulty: Int {
    case stat = 0
    case dinamic
}

final class RandomDisplayQuestionStrategy: DisplayQuestionStrategy {
    private var questionList: [QuestionItem]
    private var currentQuestionIndex = -1
    private lazy var shuffleQuestionList: [QuestionItem] = {
        questionList.shuffled()
    }()

    init(q: [QuestionItem]) {
        questionList = q
    }

    func displayQuestion() -> QuestionItem? {
        currentQuestionIndex += 1
        if !(currentQuestionIndex >= questionList.startIndex && currentQuestionIndex < questionList.endIndex) {
            return nil
        }

        return shuffleQuestionList[currentQuestionIndex]
    }
}

final class SequentialDisplayQuestionStrategy: DisplayQuestionStrategy {
    private var questionList: [QuestionItem] = []
    private var currentQuestionIndex = -1

    init(q: [QuestionItem]) {
        questionList = q
    }

    func displayQuestion() -> QuestionItem? {
        currentQuestionIndex += 1
        if !(currentQuestionIndex >= questionList.startIndex && currentQuestionIndex < questionList.endIndex) {
            return nil
        }
        return questionList[currentQuestionIndex]
    }
}
