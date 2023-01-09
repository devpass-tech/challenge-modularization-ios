import UIKit

public class ActivityDetailsViewController: UIViewController {

    lazy var activityDetailsView: ActivityDetailsView = {

        let activityDetailsView = ActivityDetailsView()
        activityDetailsView.delegate = self
        return activityDetailsView
    }()

    public init() {
          super.init(nibName: nil, bundle: nil)
      }
      
      required init?(coder: NSCoder) {
          nil
      }
    
    override public func loadView() {
        self.view = activityDetailsView
    }
}

extension ActivityDetailsViewController: ActivityDetailsViewDelegate {

    func didPressReportButton() {

        let alertViewController = UIAlertController(title: "Report an issue", message: "The issue was reported", preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks", style: .default)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true)
    }
}
