import UIKit
import ActivityDetailsInterface
import UserProfileInterface
import HomeInterface

public final class HomeFactory: HomeInterface {
    public init() {}
    public func buildViewController() -> UIViewController {
        return HomeViewController()
    }
}

class HomeViewController: UIViewController {
    lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()

    override public func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
    }

    override public func loadView() {
        self.view = homeView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func openProfile() {
//        let navigationController = UINavigationController(rootViewController: UserProfileViewController())
//        self.present(navigationController, animated: true)
    }
}

extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
//        let activityDetailsViewController = ActivityDetailsViewController()
//        self.navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
}
