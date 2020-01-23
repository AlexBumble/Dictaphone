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

        isNeedToShowEmptyLable()
        tracksView.tableView.register(TracksCell.self, forCellReuseIdentifier: TracksCell.identifier)
        tracksView.tableView.delegate = self
        tracksView.tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        isNeedToShowEmptyLable()
        tracksView.tableView.reloadData()
    }

    func isNeedToShowEmptyLable() {
        if TracksStorageManager.count == 0 {
            tracksView.tableView.isHidden = true
            tracksView.emptyLabel.isHidden = false
        } else {
            tracksView.tableView.isHidden = false
            tracksView.emptyLabel.isHidden = true
        }
    }
}


// MARK: TableView
extension TracksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TracksStorageManager.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TracksCell.identifier, for: indexPath) as! TracksCell
        cell.nameLabel.text = TracksStorageManager.getFile(atIndex: indexPath.row).readableTitile
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TracksCell.cellHeight
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TracksStorageManager.deleteFile(atIndex: indexPath.row)
            self.tracksView.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        isNeedToShowEmptyLable()
    }
}
