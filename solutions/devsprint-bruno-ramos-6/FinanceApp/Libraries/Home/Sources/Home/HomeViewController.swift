//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import UserProfile
import ActivityDetails
import Sample

public class HomeViewController: UIViewController {

    lazy var homeView: HomeView = {

        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()

    public override func viewDidLoad() {

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
    }

    public override func loadView() {
        self.view = homeView
    }

    @objc
    private func openProfile() {

        let navigationController = UINavigationController(rootViewController: UserProfileViewController())
        self.present(navigationController, animated: true)
    }
}

extension HomeViewController: HomeViewDelegate {

    func didSelectActivity() {

        let activityDetailsViewController = SampleViewController()
        self.navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
}
