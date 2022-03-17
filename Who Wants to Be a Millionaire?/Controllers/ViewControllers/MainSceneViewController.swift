//
//  MainSceneViewController.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 01.03.2022.
//

import UIKit

class MainSceneViewController: UIViewController {
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var difficultySegmented: UISegmentedControl!
    private let gameResultStorage = GameResultStorage()
    private let questionData = QuestionData()
    
    @IBAction func changeMode(_: Any) {
        switch difficultySegmented.selectedSegmentIndex {
        case 0:
            Game.shared.gameMode = .stat
        case 1:
            Game.shared.gameMode = .dinamic
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.setAllGameResults(resulsts: gameResultStorage.retrieveRecords())
        difficultySegmented.selectedSegmentIndex = Game.shared.gameMode.rawValue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        switch segue.identifier {
        case "StartGameSegue":
            guard let vc = segue.destination as? GameSceneViewController else { return }
            let gameSession = GameSession()
            Game.shared.gameSession = gameSession
            vc.gameDelegate = gameSession
            vc.questionData = questionData
        case "AddNewQuestionSegue":
            guard let vc = segue.destination as? AddNewQuestionViewController else { return }
            vc.questionData = questionData
        default:
            return
        }
    }
}
