//
//  ActivityListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import FinanceFoundations

public protocol ActivityListViewDelegate: AnyObject {
    func didSelectedActivity()
}

public class ActivityListView: UIView {

    public weak var delegate: ActivityListViewDelegate?
    
    public static let cellSize = CGFloat(82)
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ActivityCellView.self, forCellReuseIdentifier: ActivityCellView.classIdentifier())
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

   public init() {
        super.init(frame: .zero)

        backgroundColor = .white
        addSubviews()
        configureConstraints()
        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ActivityListView {

    func addSubviews() {
        addSubview(tableView)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ActivityListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityCellView.classIdentifier(), for: indexPath) as? ActivityCellView
        return cell ?? UITableViewCell()
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
