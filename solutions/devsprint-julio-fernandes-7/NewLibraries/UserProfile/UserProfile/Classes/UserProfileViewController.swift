import UIKit
import UserProfileInterface

// Design Patterns de criação
public final class UserProfileFactory: UserProfileInterface {
    
    public init() {}
    
    public func createModule() -> UIViewController {
        return UserProfileViewController()
    }
        
}

final class UserProfileViewController: UIViewController {

    override func loadView() {
        super.loadView()
        self.view = UserProfileView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
}
