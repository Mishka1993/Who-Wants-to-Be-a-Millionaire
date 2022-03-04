//
//  ResultTableViewCell.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 02.03.2022.
//

import UIKit

class ResultTableViewCell:
    
    UITableViewCell {
    @IBOutlet weak var allQuestion: UILabel!
    @IBOutlet weak var trueAnswer: UILabel!
    @IBOutlet weak var allScore: UILabel!
    @IBOutlet weak var isWinner: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(data: GameResult){
        allQuestion.text = data.allQuestion.description
        trueAnswer.text = data.trueAnswer.description
        allScore.text = data.allScore.description
        isWinner.text = data.isWinner ? "Да" : "Нет"

        if data.isWinner {
            isWinner.textColor = .green
        }
    }

}
