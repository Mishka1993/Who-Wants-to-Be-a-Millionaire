//
//  ResultViewController.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 02.03.2022.
//

import UIKit

class ResultViewController: UIViewController {

    private var resultData = [GameResult]()

    @IBOutlet var resultTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.dataSource = self

        registerNib()
        resultData = Game.shared.getAllGameResults()
        resultTableView.reloadData()
    }

    private func registerNib() {
        let nibResult = UINib(nibName: "cellResult", bundle: nil)
        resultTableView.register(nibResult, forCellReuseIdentifier: "cellResult")
    }
}

extension ResultViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        resultData.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTableView.dequeueReusableCell(withIdentifier: "cellResult", for: indexPath) as! ResultTableViewCell
        cell.configure(data: resultData[indexPath.row])
        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_: UITableView, estimatedHeightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


