//
//  RecordView.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit

class RecordView: UIView {

    var startRecordButton: UIButton!
    var stopRecord: UIButton!
    var pauseRecord: UIButton!

    // Layout Propertise
    private var buttonHeight: CGFloat = 70
    private var buttonWidth: CGFloat = 70
    private var buttonsBottomOffser: CGFloat = 140
    private var margin: CGFloat = 16

    init() {
        super.init(frame: .zero)
        layoutContent(in: self)
        applyStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layoutContent(in view: UIView) {

        startRecordButton = layout(UIButton()) { make in
            make.height.equalTo(buttonHeight)
            make.width.equalTo(buttonWidth)
            make.bottom.equalTo(view.bottom).offset(-buttonsBottomOffser)
            make.centerX.equalToSuperview().offset(-margin * 3)
        }

        stopRecord = layout(UIButton()) { make in
            make.height.equalTo(buttonHeight)
            make.width.equalTo(buttonWidth)
            make.bottom.equalTo(view.bottom).offset(-buttonsBottomOffser)
            make.centerX.equalToSuperview().offset(-margin * 3)
        }

        pauseRecord = layout(UIButton()) { make in
            make.height.equalTo(buttonHeight)
            make.width.equalTo(buttonWidth)
            make.bottom.equalTo(view.bottom).offset(-buttonsBottomOffser)
            make.centerX.equalToSuperview().offset(margin * 3)
        }
    }

    func applyStyle() {
        self.backgroundColor = .white
        startRecordButton.setBackgroundImage(UIImage(named: "Start"), for: .normal)
        stopRecord.setBackgroundImage(UIImage(named: "Stop"), for: .normal)
        pauseRecord.setBackgroundImage(UIImage(named: "Pause"), for: .normal)

    }
}
