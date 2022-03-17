//
//  GameSceneViewController.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 02.03.2022.
//

import UIKit
import Foundation

class GameSceneViewController: UIViewController {

    var gameDelegate: GameActionDelegate?
    var questionData = QuestionData()
    
    @IBOutlet weak var questinText: UILabel!
    @IBOutlet weak var gameInfo: UILabel!
    @IBOutlet weak var answersTable: UITableView!
    
    private let gameResultStorage = GameResultStorage()
    private var currentQuestion: QuestionItem?
    
    private lazy var createQuestionStrategy: DisplayQuestionStrategy = {
        let allQuestion = questionData.getAllQuestion()

        switch Game.shared.gameMode {
        case .stat:
            return SequentialDisplayQuestionStrategy(q: allQuestion)
        case .dinamic:
            return RandomDisplayQuestionStrategy(q: allQuestion)
        }
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answersTable.dataSource = self
        answersTable.delegate = self
        
        gameDelegate?.allQuestions = questionData.getCount()
        Game.shared.gameSession?.trueAnswer.addObserver(self, options: [.new, .initial])
            { [weak self] rightAnswer, _ in
                self?.gameInfo.text = "Вопрос № \(rightAnswer + 1);  \(String(format: "%.1f", Game.shared.getPct()))% правльных ответов"
            }
        displayNewQuestion()
    }
    
    private func displayNewQuestion() {
        guard let currentQuestion = questionData.getQuestion(strategy: createQuestionStrategy)
        else { return endOfGame() }

        self.currentQuestion = currentQuestion
        questinText.text = currentQuestion.question
        answersTable.reloadData()
    }
    
    private func endOfGame() {
        dismiss(animated: true, completion: nil)
        Game.shared.gameOver()
    }
    
    private func checkAnswer(answer: Answer) {
        if answer.isRight {
            // next question
            gameDelegate?.currentScoreGameSessin(scoreDelegate: answer.score)
            displayNewQuestion()
        } else {
            // game over
            endOfGame()
        }
    }

}

extension GameSceneViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        currentQuestion?.answer.count ?? 0
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell = currentQuestion?.answer[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "AnswerCell")

        var conf = cell.defaultContentConfiguration()
        conf.text = dataCell?.option
        conf.textProperties.color = .white
        
        cell.contentConfiguration = conf
        cell.backgroundColor = UIColor(red: 0.015, green: 0.007, blue: 0.184, alpha: 1.0)
        
        return cell
    }
}

extension GameSceneViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(
            title: "Confirm",
            message: "Are you sure?",
            preferredStyle: .actionSheet
        )

        alert.addAction(
            UIAlertAction(
                title: NSLocalizedString("Yes", comment: "Default action"),
                style: .default,
                handler: { [weak self] _ in
                    guard let answer = self?.currentQuestion?.answer[indexPath.row] else {
                        return
                    }
                    self?.checkAnswer(answer: answer)
                }
            )
        )

        alert.addAction(
            UIAlertAction(
                title: "Cancel",
                style: .cancel,
                handler: nil
            )
        )

        present(alert, animated: true, completion: nil)
        answersTable.cellForRow(at: indexPath)?.setSelected(false, animated: true)
    }
}
