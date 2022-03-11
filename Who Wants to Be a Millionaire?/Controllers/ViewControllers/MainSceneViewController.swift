//
//  MainSceneViewController.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 01.03.2022.
//

import UIKit

class MainSceneViewController: UIViewController {
    @IBOutlet weak var newGame: UIButton!
    private let gameResultStorage = GameResultStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.setAllGameResults(resulsts: gameResultStorage.retrieveRecords())
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        switch segue.identifier {
        case "StartGameSegue":
            guard let vc = segue.destination as? GameSceneViewController else { return }
            let gameSession = GameSession()
            Game.shared.gameSession = gameSession
            vc.gameDelegate = gameSession

            //        case "ResultGameSegue":
            //            guard let vc = segue.destination as? ResultViewController else { return }

        default:
            return
        }
    }
}
