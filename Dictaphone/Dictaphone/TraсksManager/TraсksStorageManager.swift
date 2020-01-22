//
//  TracksStorageManager.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import Foundation
import RxSwift

class TracksStorageManager {

    static var dirPath: String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }

    static var fileList: [String]! {
        let manager = FileManager.default
        let files = try! manager.contentsOfDirectory(atPath: dirPath)
        return files.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedDescending }
    }

    static var count: Int {
        get {
           return fileList.count
        }
    }

   static func getFile(atIndex index: Int) -> TracksDataModel {
        let filePath = URL(string: "\(dirPath)/\(fileList[index])")
        let title = fileList[index]
        return TracksDataModel(filePathUrl: filePath!, title: title)
    }

    static func deleteFile(atIndex index: Int) {
        let filePath = URL(fileURLWithPath: "\(dirPath)/\(fileList[index])")
        try! FileManager.default.removeItem(at: filePath)
    }
}
