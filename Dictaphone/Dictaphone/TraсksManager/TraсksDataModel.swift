//
//  TracksDataModel.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import Foundation

/**
Struct that contains storaged audio tracks

 **Parameters**

 filePathUrl - addres of file in storage

 title - file name path of filePathUrl

 readableTitile - readable title
 */
/// - Tag: TracksDataModel
struct TracksDataModel {

    let filePathUrl: URL
    let title: String

    /// Return file name in humman redable formate "dd.MM.yyyy HH:mm:ss"
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

    /// Return file name with current date in formate like "ddMMyyyy-HHmmss" + ".m4a"
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
