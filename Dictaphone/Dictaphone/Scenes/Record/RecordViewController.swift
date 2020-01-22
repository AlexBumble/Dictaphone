//
//  RecordViewController.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    var recordView: RecordView!

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
    }
}
