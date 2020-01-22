//
//  RecordViewController.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit
import AVFoundation
import RxSwift
import RxCocoa

class RecordViewController: UIViewController, AVAudioRecorderDelegate {

    var recordView: RecordView!
    var audioRecorder: AVAudioRecorder!
    private let disposeBag = DisposeBag()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        recordView = RecordView()
        view = recordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recordView.stopRecordButton.isHidden = true
        startRecordButtonBind()
        stopRecordButtonBind()
    }

    override func viewWillAppear(_ animated: Bool) {
        audioRecorder = audioRecorder(URL(fileURLWithPath:"/dev/null"))
        audioRecorder.record()
    }

    func recordAudio() {
        audioRecorder.stop()
        audioRecorder = audioRecorder(RecordModel.timestampedFilePath())
        audioRecorder.delegate = self
        audioRecorder.record()
    }

    func stopRecordingAudio() {
        audioRecorder.stop()
        try! AVAudioSession.sharedInstance().setActive(false)
    }

    func audioRecorder(_ filePath: URL) -> AVAudioRecorder {
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
}

// MARK: Rx SetUp

private extension RecordViewController {

    func startRecordButtonBind() {
        recordView.startRecordButton.rx.tap.bind {
            self.recordAudio()
            self.recordView.startRecordButton.isHidden = true
            self.recordView.stopRecordButton.isHidden = false
        }
        .disposed(by: disposeBag)
    }

    func stopRecordButtonBind() {
        recordView.stopRecordButton.rx.tap.bind {
            self.stopRecordingAudio()
            self.recordView.startRecordButton.isHidden = false
            self.recordView.stopRecordButton.isHidden = true
        }
        .disposed(by: disposeBag)
    }
}
