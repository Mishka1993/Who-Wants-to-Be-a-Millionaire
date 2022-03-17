//
//  QuestionStorage.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Михаил Киржнер on 16.03.2022.
//

import Foundation

final class QuestionStorage {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "questionStorage"

    func save(records: [QuestionItem]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func retrieveRecords() -> [QuestionItem] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([QuestionItem].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
