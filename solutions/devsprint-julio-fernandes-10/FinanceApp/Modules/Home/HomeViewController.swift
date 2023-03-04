//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import FinanceService
import ActivityDetails

final class HomeViewController: UIViewController {
    // MARK: - Properties
    private lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()
    
    private let service: FinanceServiceProtocol
    
    // MARK: - Initializers
    init(_ service: FinanceServiceProtocol = FinanceService()) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
        fetchHomeData()
    }

    override func loadView() {
        self.view = homeView
    }

    // MARK: - Methods
    @objc
    func openProfile() {
        let navigationController = UINavigationController(rootViewController: UserProfileViewController())
        self.present(navigationController, animated: true)
    }
    
    private func fetchHomeData() {
        let mainQueueDecorator = MainQueueDecorator(service)
        mainQueueDecorator.fetchData(HomeData.self, endpoint: .home) { result in
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

extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
        let activityDetailsViewController = ActivityDetailsViewController()
        self.navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
}
