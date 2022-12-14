//
//  HomeHeaderView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Components
import Foundation
import UIKit

public class HomeHeaderView: UIView, ViewCode {

    let stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return stackView
    }()

    let label: UILabel = {

        let label = UILabel()
        label.text = "$15,459.27"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()

    let savingsStackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        return stackView
    }()

    let savingsLabel: UILabel = {

        let label = UILabel()
        label.text = "Savings"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    let savingsValueLabel: UILabel = {

        let label = UILabel()
        label.text = "$100.00"
        label.textColor = .lightGray
        return label
    }()

    let spendingStackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        return stackView
    }()

    let spendingLabel: UILabel = {

        let label = UILabel()
        label.text = "Spending"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    let spendingValueLabel: UILabel = {

        let label = UILabel()
        label.text = "$100.00"
        label.textColor = .lightGray
        return label
    }()

    public init() {
        super.init(frame: .zero)
        
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupComponents() {
        savingsStackView.addArrangedSubview(savingsLabel)
        savingsStackView.addArrangedSubview(savingsValueLabel)

        spendingStackView.addArrangedSubview(spendingLabel)
        spendingStackView.addArrangedSubview(spendingValueLabel)

        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(savingsStackView)
        stackView.addArrangedSubview(spendingStackView)
        addSubview(stackView)
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)

        ])
    }
    
    public func setupExtraConfiguration() {
        backgroundColor = .white
    }
}
