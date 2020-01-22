//
//  TracksTableViewCell.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit

class TracksCell: UITableViewCell {

    static let identifier = "TracksCell"

    //View components 
    var nameLabel: UILabel!
    var playImageView: UIImageView!

    // Layout Propertise
    private var margin: CGFloat = 16
    private var buttonSideValue: CGFloat = 28
    static let cellHeight: CGFloat = 60

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutContent(in: self)
        applyStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layoutContent(in: UIView) {

        playImageView = layout(UIImageView()) { make in
            make.top.equalTo(safeArea).offset(margin)
            make.trailing.equalTo(safeArea).offset(-margin)
            make.height.width.equalTo(buttonSideValue)
        }

        nameLabel = layout(UILabel()) { make in
            make.top.leading.equalTo(safeArea).offset(margin)
            make.trailing.equalTo(playImageView.leading).offset(-margin)
        }

    }

    func configureWithTraсks(track: TracksDataModel) {
        nameLabel.text = track.title
    }

    func applyStyle() {
        playImageView.image = Theme.startButton
    }
}


