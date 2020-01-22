//
//  TracksViewController.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit

class TracksViewController: UIViewController {

    private var tracksView: TracksView!

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

    override func viewWillAppear(_ animated: Bool) {
        tracksView.tableView.reloadData()
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

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TracksCell.cellHeight
    }
}
