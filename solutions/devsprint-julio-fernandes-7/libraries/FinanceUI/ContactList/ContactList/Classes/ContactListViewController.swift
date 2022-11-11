import UIKit
import ContactListInterface

final class ContactListViewController: UIViewController {

    private weak var delegate: ContactListViewControllerDelegate?

    private lazy var contactListView: ContactListView = {
        let contactListView = ContactListView()
        contactListView.delegate = self
        return contactListView
    }()
    
    init(delegate: ContactListViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil) 
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = contactListView
    }

    override func viewDidLoad() {
        self.title = Localization.ContactList.title
    }
}

extension ContactListViewController: ContactListViewDelegate {

    func didSelectContact() {
        delegate?.didSelectContact()
    }
}
