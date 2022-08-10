import UIKit

public final class UserProfileViewController: UIViewController {
    
    // MARK: - LifeCycle
    
    public override func loadView() {
        view = UserProfileView()
    }
}
