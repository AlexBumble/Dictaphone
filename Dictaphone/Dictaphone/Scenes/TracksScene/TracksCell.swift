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

    // Layout Propertise
    private var margin: CGFloat = 16

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutContent(in: contentView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layoutContent(in: UIView) {
        nameLabel = layout(UILabel()) { make in
            make.edges.equalToSuperview().offset(margin)
        }
    }

    func configureWithTraсks(track: TracksDataModel) {
        nameLabel.text = track.title
    }
}
