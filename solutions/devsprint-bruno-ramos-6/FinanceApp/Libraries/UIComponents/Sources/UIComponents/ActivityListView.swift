//
//  ActivityListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Components
import UIKit

public protocol ActivityListViewDelegate: AnyObject {

    func didSelectedActivity()
}

public class ActivityListView: UIView, ViewCode {

    public weak var delegate: ActivityListViewDelegate?

    public static let cellSize = CGFloat(82)

    let cellIdentifier = "ActivityCellIdentifier"

    public lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ActivityCellView.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    public init() {
        super.init(frame: .zero)

        setup()
        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupComponents() {
        addSubview(tableView)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([

            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    public func setupExtraConfiguration() {
        backgroundColor = .white
    }
}

extension ActivityListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ActivityCellView

        return cell
    }
}

extension ActivityListView: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ActivityListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        delegate?.didSelectedActivity()
    }
}

