import Foundation
import UIKit
import Components

class UserProfileView: UIView {

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self

        let headerView = UserProfileHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: 0, height: 232)
        tableView.tableHeaderView = headerView
        return tableView
    }()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserProfileView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")

        switch indexPath.row {
        case 0:

            cell.textLabel?.text = Localization.UserProfile.Phone.title
            cell.detailTextLabel?.text = "+55 (11) 99999-9999"
        case 1:

            cell.textLabel?.text = Localization.UserProfile.Email.title
            cell.detailTextLabel?.text = "user@devpass.com"
        case 2:

            cell.textLabel?.text = Localization.UserProfile.Address.title
            cell.detailTextLabel?.text = "Rua Bela Cintra, 495"
        default:
            break
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Localization.UserProfile.Header.title
    }

}
