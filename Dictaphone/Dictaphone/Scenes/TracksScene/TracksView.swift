//
//  TraсksView.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit

class TracksView: UIView {

    var tableView: UITableView!

    init() {
        super.init(frame: .zero)
        layoutContent(in: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layoutContent(in: UIView) {
        tableView = layout(UITableView()) { make in
            make.edges.equalToSuperview()
        }
    }
}
