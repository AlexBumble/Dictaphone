//
//  TracksStorageManager.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import Foundation

/// Container for Tracks storage management
final class TracksStorageManager {

    /// Return current documentDirectory where traks a stored audio tracks
    static var dirPath: String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }

    /// List of all audio tracks in storage
    /// - Tag: fileList
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

    /// Return audio track by his index in [TracksStorageManager.fileList](x-source-tag://fileList).
    /// In [TracksDataModel](x-source-tag://TracksDataModel) format
   static func getFile(atIndex index: Int) -> TracksDataModel {
        let filePath = URL(string: "\(dirPath)/\(fileList[index])")
        let title = fileList[index]
        return TracksDataModel(filePathUrl: filePath!, title: title)
    }

    /// Delete by his index in [TracksStorageManager.fileList](x-source-tag://fileList).
    static func deleteFile(atIndex index: Int) {
        let filePath = URL(fileURLWithPath: "\(dirPath)/\(fileList[index])")
        do {
            try FileManager.default.removeItem(at: filePath)
        }
        catch {
            print(
                    """
                    Can't delete file: \(filePath).
                    Error in: \(#function) of file \(#file)
                    """
                )
        }
    }
}
