//
//  GameSceneViewController.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 02.03.2022.
//

import UIKit

class GameSceneViewController: UIViewController {

    var gameDelegate: GameActionDelegate?
    @IBOutlet weak var questinText: UILabel!
    @IBOutlet var Answers: [UIButton]!
    
    private var currentQuestionIndex = 0
    private let gameResultStorage = GameResultStorage()

    private var currentQuestion: QuestionItem? {
        didSet {
            displayQuestion()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.setAllGameResults(resulsts: gameResultStorage.retrieveRecords())
        startGame()
        loadNewQuestion(isIntGame: true)
        gameDelegate?.allQuestions = questions.count
    }
    
    private func loadNewQuestion(isIntGame: Bool = false) {
        if !isIntGame {
            currentQuestionIndex += 1
        }

        if !(currentQuestionIndex >= questions.startIndex && currentQuestionIndex < questions.endIndex) {
            endOfGame()
            return
        }
    }
    
    private func displayQuestion() {
        questinText.text = currentQuestion?.question
        //answerTableView.reloadData()
    }
    
    private func endOfGame() {
        dismiss(animated: true, completion: nil)
        Game.shared.gameOver()
    }
    
    private func checkAnswer(answer: Answer) {
        if answer.isRight {
            // next question
            gameDelegate?.currentScoreGameSessin(scoreDelegate: answer.score)
            loadNewQuestion()
        } else {
            // game over
            endOfGame()
        }
    }
    private func startGame() {
        let gameSession = GameSession()
        Game.shared.gameSession = gameSession
    }
}
