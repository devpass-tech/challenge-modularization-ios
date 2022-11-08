import UIKit

public final class UserProfileViewController: UIViewController {

    public override func loadView() {
        super.loadView()
        self.view = UserProfileView()
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
}
