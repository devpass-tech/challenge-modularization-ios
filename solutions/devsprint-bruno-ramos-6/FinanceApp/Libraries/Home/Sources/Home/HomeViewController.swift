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

    private let onRouteToUserProfile: (UIViewController) -> Void
    private let onRouteToActivityDetail: (UIViewController) -> Void

    public init(
        onRouteToUserProfile: @escaping (UIViewController) -> Void,
        onRouteToActivityDetail: @escaping (UIViewController) -> Void
    ) {
        self.onRouteToUserProfile = onRouteToUserProfile
        self.onRouteToActivityDetail = onRouteToActivityDetail
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    public override func viewDidLoad() {

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
    }

    public override func loadView() {
        self.view = homeView
    }

    @objc
    private func openProfile() {
        onRouteToUserProfile(self)
    }
}

extension HomeViewController: HomeViewDelegate {

    func didSelectActivity() {
        onRouteToActivityDetail(self)
    }
}
