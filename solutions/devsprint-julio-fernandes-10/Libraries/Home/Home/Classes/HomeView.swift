//
//  HomeView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import Components
import FinanceService
import FinanceExtensions

protocol HomeViewDelegate: AnyObject {
    func didSelectActivity()
}

class HomeView: UIView {
    weak var delegate: HomeViewDelegate?

    let homeHeaderView: HomeHeaderView = {
        let homeHeaderView = HomeHeaderView()
        homeHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return homeHeaderView
    }()

    lazy var activityListView: ActivityListView = {
        let activityListView = ActivityListView()
        activityListView.translatesAutoresizingMaskIntoConstraints = false
        activityListView.delegate = self
        return activityListView
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupHierarchyView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ model: HomeData) {
        homeHeaderView.label.text = String(model.balance).toCurrency()
        homeHeaderView.savingsValueLabel.text = String(model.savings).toCurrency()
        homeHeaderView.spendingValueLabel.text = String(model.spending).toCurrency()
        activityListView.setup(model.activity)
    }
    
    func setupHierarchyView() {
        addSubview(homeHeaderView)
        addSubview(activityListView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            homeHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            homeHeaderView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            homeHeaderView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

            activityListView.topAnchor.constraint(equalTo: homeHeaderView.bottomAnchor, constant: 32),
            activityListView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            activityListView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            activityListView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomeView: ActivityListViewDelegate {
    func didSelectedActivity() {
        delegate?.didSelectActivity()
    }
}
