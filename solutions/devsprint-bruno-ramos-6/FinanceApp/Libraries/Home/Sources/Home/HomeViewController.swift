//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

public class HomeViewController: UIViewController {

    lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()

    private let service: HomeServiceProtocol

    public init(service: HomeServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    public override func viewDidLoad() {

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))

        service.fetch { result in
            switch result {
            case .success(let activities):
                print(activities)
            case .failure(let error):
                print(error)
            }

        }
    }

    public override func loadView() {
        self.view = homeView
    }

    @objc
    private func openProfile() {
    }
}

extension HomeViewController: HomeViewDelegate {

    func didSelectActivity() {
    }
}
