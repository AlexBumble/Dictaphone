//
//  RecordView.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit

class RecordView: UIView {

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
        self.backgroundColor = Theme.backgroundColor
        layoutContent(in: self)
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
