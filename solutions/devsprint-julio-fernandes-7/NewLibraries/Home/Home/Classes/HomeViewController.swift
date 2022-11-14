import UIKit
import UserProfileInterface
import ActivityDetailsInterface
import HomeInterface
import FinanceServiceInterface
import Components

// Design Patterns de criação
public final class HomeFactory: HomeInterface {
    
    private let container: DependencyInjectorInterface
    private let service: FinanceServiceInterface
    public init(container: DependencyInjectorInterface, service: FinanceServiceInterface) {
        self.container = container
        self.service = service
    }
    
    public func createModule() -> UIViewController {
        return HomeViewController(container: container, service: service)
    }
}

final class HomeViewController: UIViewController {
    
    private let container: DependencyInjectorInterface
    private let service: FinanceServiceInterface
    
    lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()
    
    public init(container: DependencyInjectorInterface, service: FinanceServiceInterface) {
        self.container = container
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Localization.Home.RightBarButtonItem.title, style: .plain, target: self, action: #selector(openProfile))
    }

    override func loadView() {
        self.view = homeView
    }
    
    func fetchData() {
        service.load(endpoint: .home) { [weak self] (result: Result<HomeData, Error>) in
            guard let self = self else { return }
            switch result {
            case let .success(dto): self.homeView.setup(data: dto)
            default: break
            }
        }
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
        let activityDetailsViewController = container.forceResolve(ActivityDetailsInterface.self)
        show(activityDetailsViewController.createModule(), sender: self)
    }
    
}

public extension DispatchQueue {
    func safeAsync(_ block: @escaping () -> Void ) {
        if self === DispatchQueue.main && Thread.isMainThread {
            block()
        } else {
            async { block() }
        }
    }
}
