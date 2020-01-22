//
//  RecordView.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class RecordView: UIView {
    //Observable Theme
    private var theme = Observable.just(Theme.current)
    private let disposeBag = DisposeBag()

    //View components 
    var startRecordButton: UIButton!
    var stopRecordButton: UIButton!
    var pauseRecordButton: UIButton!
    var resumeRecordButton: UIButton!

    // Layout Propertise
    private var buttonSideValue: CGFloat = 70
    private var buttonsBottomOffser: CGFloat = 140
    private var margin: CGFloat = 16
    private var centerXOffset: CGFloat = 48

    init() {
        super.init(frame: .zero)
        layoutContent(in: self)
        setupTheme()
        applyStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layoutContent(in view: UIView) {

        startRecordButton = layout(UIButton()) { make in
            make.height.width.equalTo(buttonSideValue)
            make.bottom.equalTo(view.bottom).offset(-buttonsBottomOffser)
            make.centerX.equalToSuperview()
        }

        stopRecordButton = layout(UIButton()) { make in
            make.height.width.equalTo(buttonSideValue)
            make.bottom.equalTo(view.bottom).offset(-buttonsBottomOffser)
            make.centerX.equalToSuperview().offset(-centerXOffset)
        }

        pauseRecordButton = layout(UIButton()) { make in
            make.height.width.equalTo(buttonSideValue)
            make.bottom.equalTo(view.bottom).offset(-buttonsBottomOffser)
            make.centerX.equalToSuperview().offset(centerXOffset)
        }

        resumeRecordButton = layout(UIButton()) { make in
            make.height.width.equalTo(buttonSideValue)
            make.bottom.equalTo(view.bottom).offset(-buttonsBottomOffser)
            make.centerX.equalToSuperview().offset(centerXOffset)
        }
    }

    func applyStyle() {
        startRecordButton.setBackgroundImage(Theme.addRecord, for: .normal)
        stopRecordButton.setBackgroundImage(Theme.stopRecordButton, for: .normal)
        pauseRecordButton.setBackgroundImage(Theme.pauseRecordButton, for: .normal)
        resumeRecordButton.setBackgroundImage(Theme.startButton, for: .normal)

    }
}

// MARK: Rx Setup
extension RecordView {
    func setupTheme() {
        theme
            .subscribe(onNext: { theme in
                self.applyStyle()
            })
            .disposed(by: disposeBag)
    }
}
