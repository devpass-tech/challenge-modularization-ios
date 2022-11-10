import UIKit
import UserProfile
import ActivityDetails
import HomeInterface

// Design Patterns de criação
public final class HomeFactory: HomeInterface {
    
    public init() {}
    
    public func createModule() -> UIViewController {
        return HomeViewController()
    }
        
}

final class HomeViewController: UIViewController {

    lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Localization.Home.RightBarButtonItem.title, style: .plain, target: self, action: #selector(openProfile))
    }

    override func loadView() {
        self.view = homeView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    @objc
    func openProfile() {
        let navigationController = UINavigationController(rootViewController: UserProfileViewController())
        self.present(navigationController, animated: true)
    }
}

extension HomeViewController: HomeViewDelegate {

    func didSelectActivity() {
        let activityDetailsViewController = ActivityDetailsViewController()
        self.navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
    
}
