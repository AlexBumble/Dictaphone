//
//  TraсksView.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit

class TracksView: UIView {
    
    //View components
    var tableView: UITableView!
    var emptyLabel: UILabel!
    // Layout Propertise
    private var margin: CGFloat = 16

    init() {
        super.init(frame: .zero)
        layoutContent(in: self)
        emptyLabelText()
        self.backgroundColor = Theme.backgroundColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layoutContent(in: UIView) {
        tableView = layout(UITableView()) { make in
            make.edges.equalToSuperview()
        }

        emptyLabel = layout(UILabel()) { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(margin)
            make.trailing.equalToSuperview().offset(-margin)
        }
    }

    func emptyLabelText() {
        emptyLabel.text =
        """
        Sound track list is empty.
        Rrecord the sound in the recording window to listen to the audio.
        """
        emptyLabel.numberOfLines = 3
        emptyLabel.lineBreakMode = .byWordWrapping
        emptyLabel.textColor = Theme.fontColor
        emptyLabel.textAlignment = .center
    }
}
