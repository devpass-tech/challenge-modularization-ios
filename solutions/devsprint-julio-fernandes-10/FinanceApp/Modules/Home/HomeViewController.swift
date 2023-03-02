//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import FinanceService

final class HomeViewController: UIViewController {
    private lazy var homeView: HomeView = {
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
                    self.homeView.setup(homeData)
                    
                case .failure(let error):
                    let alertViewController = UIAlertController(title: "Ops, algo de errado aconteceu!!!",
                                                                message: error.localizedDescription,
                                                                preferredStyle: .alert)
                    
                    alertViewController.addAction(UIAlertAction(title: "Fechar", style: .default))
                    self.present(alertViewController, animated: true)
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
