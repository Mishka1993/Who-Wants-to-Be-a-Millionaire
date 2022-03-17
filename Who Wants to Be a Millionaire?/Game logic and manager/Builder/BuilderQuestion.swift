//
//  BuilderQuestion.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 17.03.2022.
//

import Foundation

class BuilderQuestion {
    var question: String
    var answers = [Answer]()

    init(question: String) {
        self.question = question
    }

    func build() -> QuestionItem? {
        guard answers.count > 0,
              !question.isEmpty
        else { return nil }

        return QuestionItem(question: question, answer: answers)
    }

    func addAnswer(answer: Answer) {
        answers.append(answer)
    }

    func validateAnswers() -> Bool {
        var hasScore = false

        for answer in answers {
            if answer.option.isEmpty {
                return false
            }
            if answer.score > 0 {
                hasScore = true
            }
        }
        return hasScore && answers.count > 0
    }
}
