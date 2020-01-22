//
//  TracksViewController.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TracksViewController: UIViewController {

    private var tracksView: TracksView!
    private let disposeBag = DisposeBag()
    private let traks = Observable.just(TracksStorageManager.fileList)

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        tracksView = TracksView()
        view = tracksView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tracksView.tableView.register(TracksCell.self, forCellReuseIdentifier: TracksCell.identifier)
        tracksView.tableView.delegate = self
        tracksView.tableView.dataSource = self
    }
}


// MARK: TableView
extension TracksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TracksStorageManager.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TracksCell.identifier, for: indexPath) as! TracksCell
        cell.nameLabel.text = TracksStorageManager.getFile(atIndex: indexPath.row).title
        return cell
    }
}
