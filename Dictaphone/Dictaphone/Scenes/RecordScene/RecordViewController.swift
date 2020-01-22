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

    private var recordView: RecordView!
    private var recordModel: Recording!
    private let disposeBag = DisposeBag()

    init(recordModel: Recording = RecordModel()) {
        super.init(nibName: nil, bundle: nil)
        self.recordModel = recordModel
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
        recordView.pauseRecordButton.isHidden = true
        startRecordButtonBind()
        stopRecordButtonBind()
        pauseBind()
    }

    override func viewWillDisappear(_ animated: Bool) {
        stopRecord()
    }

    func startRecord() {
        recordModel.recordAudio()
        recordView.startRecordButton.isHidden = true
        recordView.stopRecordButton.isHidden = false
        recordView.pauseRecordButton.isHidden = false
    }

    func stopRecord() {
        recordModel.stopRecordingAudio()
        recordView.startRecordButton.isHidden = false
        recordView.stopRecordButton.isHidden = true
        recordView.pauseRecordButton.isHidden = true
    }
}

// MARK: Rx Setup
private extension RecordViewController {

    func startRecordButtonBind() {
        recordView.startRecordButton.rx.tap.bind {
            self.startRecord()
        }
        .disposed(by: disposeBag)
    }

    func stopRecordButtonBind() {
        recordView.stopRecordButton.rx.tap.bind {
            self.stopRecord()
        }
        .disposed(by: disposeBag)
    }

    func pauseBind() {
        recordView.pauseRecordButton.rx.tap.bind {
            //ToDo
        }
        .disposed(by: disposeBag)
    }
}
