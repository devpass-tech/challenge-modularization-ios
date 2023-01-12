import UIKit
import ActivityDetailsInterface
import UserProfileInterface
import HomeInterface

public final class HomeFactory: HomeInterface {
    
    private let userProfile: UserProfileInterface
    private let activityDetails: ActivityDetailsInterface
    
    public init(userProfile: UserProfileInterface, activityDetails: ActivityDetailsInterface) {
        self.userProfile = userProfile
        self.activityDetails = activityDetails
    }
    
    public func buildViewController() -> UIViewController {
        return HomeViewController(userProfile: userProfile, activityDetails: activityDetails)
    }
}

class HomeViewController: UIViewController {
    
    private let userProfile: UserProfileInterface
    private let activityDetails: ActivityDetailsInterface
    
    init(userProfile: UserProfileInterface, activityDetails: ActivityDetailsInterface) {
        self.userProfile = userProfile
        self.activityDetails = activityDetails
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    @objc
    func openProfile() {
        let controller = userProfile.buildViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        self.present(navigationController, animated: true)
    }
}

extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
        let controller = activityDetails.buildViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
