//
//  TracksDataModel.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import Foundation

struct TracksDataModel {
    let filePathUrl: URL
    let title: String
    var readableTitile: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        guard let date = formatter.date(from: String(self.title.dropLast(4))) else {
            return self.title
        }
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
}

extension TracksDataModel {

    static func timestampedFilePath() -> URL {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let title = formatter.string(from: currentDateTime) + ".m4a"
        let filePath = URL(string: "\(dirPath)/\(title)")!

        return filePath
    }
}
