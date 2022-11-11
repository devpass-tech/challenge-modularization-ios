import UIKit
import ContactListInterface

public final class ContactListFactory: ContactListInterface {
    public init() { }
    
    public func createModule(delegate: ContactListViewControllerDelegate) -> UIViewController {
        return ContactListViewController(delegate: delegate)
    }
}
