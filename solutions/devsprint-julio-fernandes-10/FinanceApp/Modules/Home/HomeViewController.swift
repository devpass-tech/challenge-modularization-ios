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
        self.service = MainQueueDecorator(decoratee: service)
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
        service.fetchData(HomeData.self, endpoint: .home) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let homeData):
                self.homeView.setup(homeData)
                
            case .failure(let error):
                self.showAlertController(title: "Ops, algo de errado aconteceu!!!", message:  error.localizedDescription, buttonTitle: "Fechar")
            }
        }
    }
    
    private func showAlertController(title: String, message: String, buttonTitle: String) {
        let alertViewController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: .alert)
        
        alertViewController.addAction(UIAlertAction(title: buttonTitle, style: .default))
        self.present(alertViewController, animated: true)
    }
}

extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
        let activityDetailsViewController = ActivityDetailsViewController()
        self.navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
}
