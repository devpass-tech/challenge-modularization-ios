//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import FinanceService

class HomeViewController: UIViewController {

    lazy var homeView: HomeView = {

        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()

    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
        fetchHomeData()
    }

    override func loadView() {
        self.view = homeView
    }

    @objc
    func openProfile() {

        let navigationController = UINavigationController(rootViewController: UserProfileViewController())
        self.present(navigationController, animated: true)
    }
    
    private func fetchHomeData() {
        let service = FinanceService()
        service.fetchData(HomeData.self, endpoint: .home) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let homeData):
                    print(homeData)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

extension HomeViewController: HomeViewDelegate {

    func didSelectActivity() {

        let activityDetailsViewController = ActivityDetailsViewController()
        self.navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
}
