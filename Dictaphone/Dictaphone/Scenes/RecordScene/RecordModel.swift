//
//  RecordModel.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import Foundation
import AVFoundation


protocol Recording {
    func recordAudio()
    func stopRecordingAudio()
}

class RecordModel: NSObject, AVAudioRecorderDelegate {

    private var audioRecorder: AVAudioRecorder!

    override init() {
        super.init()
        self.audioRecorder = makeAudioRecorder(URL(fileURLWithPath:"/dev/null"))
        audioRecorder.record()
    }

    func makeAudioRecorder(_ filePath: URL) -> AVAudioRecorder {
        let recorderSettings: [String : AnyObject] = [
            AVSampleRateKey: 44100.0 as AnyObject,
            AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC),
            AVNumberOfChannelsKey: 2 as AnyObject,
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue as AnyObject
        ]

        try! AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, options: [])

        let audioRecorder = try! AVAudioRecorder(url: filePath, settings: recorderSettings)
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()

        return audioRecorder
    }

    func timestampedFilePath() -> URL {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.string(from: currentDateTime)+".m4a"
        let filePath = URL(string: "\(dirPath)/\(recordingName)")!

        return filePath
    }
}

extension RecordModel: Recording {

    func recordAudio() {
        audioRecorder.stop()
        audioRecorder = makeAudioRecorder(timestampedFilePath())
        audioRecorder.delegate = self
        audioRecorder.record()
    }

    func stopRecordingAudio() {
        audioRecorder.stop()
        try! AVAudioSession.sharedInstance().setActive(false)
    }
}
