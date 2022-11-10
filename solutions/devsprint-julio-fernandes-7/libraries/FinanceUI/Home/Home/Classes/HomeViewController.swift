import UIKit
import Swinject
import UserProfileInterface
import ActivityDetails
import HomeInterface
import Components

// Design Patterns de criação
public final class HomeFactory: HomeInterface {
    
    private let container: DependencyInjectorInterface
    public init(container: DependencyInjectorInterface) {
        self.container = container
    }
    
    public func createModule() -> UIViewController {
        return HomeViewController(container: container)
    }
        
}

final class HomeViewController: UIViewController {

    lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()
    
    private let container: DependencyInjectorInterface

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Localization.Home.RightBarButtonItem.title, style: .plain, target: self, action: #selector(openProfile))
    }

    override func loadView() {
        self.view = homeView
    }
    
    init(container: DependencyInjectorInterface) {
        self.container = container
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    @objc
    func openProfile() {
        let controller = container.forceResolve(UserProfileInterface.self)
        let navigationController = UINavigationController(rootViewController: controller.createModule())
        self.present(navigationController, animated: true)
    }
}

extension HomeViewController: HomeViewDelegate {

    func didSelectActivity() {
        let activityDetailsViewController = ActivityDetailsViewController()
        self.navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
    
}
