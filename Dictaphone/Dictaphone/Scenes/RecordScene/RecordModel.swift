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
    func pauseRecordingAudio()
    func resume()
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

        try! AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, options: []) // ToDo Error

        let audioRecorder = try! AVAudioRecorder(url: filePath, settings: recorderSettings) // ToDo Error
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()

        return audioRecorder
    }
}

extension RecordModel: Recording {

    func recordAudio() {
        audioRecorder.stop()
        audioRecorder = makeAudioRecorder(TracksDataModel.timestampedFilePath())
        audioRecorder.delegate = self
        audioRecorder.record()
    }

    func stopRecordingAudio() {
        audioRecorder.stop()
        try! AVAudioSession.sharedInstance().setActive(false) // ToDo Error
    }

    func pauseRecordingAudio() {
        audioRecorder.pause()
    }

    func resume() {
        audioRecorder.record()
    }
}
