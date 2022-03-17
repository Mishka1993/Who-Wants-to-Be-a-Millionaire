//
//  QuestionData.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 16.03.2022.
//

import Foundation
final class QuestionData {
    private var questionStorage = QuestionStorage()
    private var questions = [QuestionItem(question: "Где дети ищут подарки утром 1 января?",
                                          answer: [Answer(option: "под палкой", score: 0),
                                                   Answer(option: "под скалкой", score: 0),
                                                   Answer(option: "под ёлкой", score: 1000),
                                                   Answer(option: "под мухой", score: 0)]),
                             QuestionItem(question: "Что из перечисленного пирог?",
                                          answer: [Answer(option: "кулебяка", score: 1000),
                                                   Answer(option: "кусака", score: 0),
                                                   Answer(option: "закаляка", score: 0),
                                                   Answer(option: "забияка", score: 0)]),
                             QuestionItem(question: "Провожают, как известно, по уму, а как встречают?",
                                          answer: [Answer(option: "по одёжке", score: 1000),
                                                   Answer(option: "по сберкнижке", score: 0),
                                                   Answer(option: "по прописке", score: 0),
                                                   Answer(option: "по рекомендации", score: 0)]),
                             QuestionItem(question: "Как называют мелководный бассейн, предназначенный для детей?",
                                          answer: [Answer(option: "утятник", score: 0),
                                                   Answer(option: "лягушатник", score: 1000),
                                                   Answer(option: "селёдочник", score: 0),
                                                   Answer(option: "тюленник", score: 0)]),
                             QuestionItem(question: "Какой предмет стал причиной смерти французского композитора Жан-Батиста Люлли?",
                                          answer: [Answer(option: "дирижёрская трость", score: 1000),
                                                   Answer(option: "струна рояля", score: 0),
                                                   Answer(option: "гусиное перо", score: 0),
                                                   Answer(option: "смычок скрипки", score: 0)]),
                             QuestionItem(question: "Что не умеют делать ящерицы гекконы?",
                                          answer: [Answer(option: "ловить рыбу", score: 1000),
                                                   Answer(option: "ходить по потолку", score: 0),
                                                   Answer(option: "менять цвет", score: 0),
                                                   Answer(option: "петь", score: 0)])
    ]{
        didSet {
            questionStorage.save(records: questions)
        }
    }
    
    func setQuestion(newQuestion: QuestionItem) {
        questions.append(newQuestion)
    }
    
    func getAllQuestion() -> [QuestionItem] {
        let questionListFromStorage = questionStorage.retrieveRecords()
        if questionListFromStorage.count > 0 {
            return questionListFromStorage
        }
        
        return questions
    }
    func getCount() -> Int {
        return getAllQuestion().count
    }
    
    func getQuestion(strategy: DisplayQuestionStrategy) -> QuestionItem? {
        return strategy.displayQuestion()
    }
}
