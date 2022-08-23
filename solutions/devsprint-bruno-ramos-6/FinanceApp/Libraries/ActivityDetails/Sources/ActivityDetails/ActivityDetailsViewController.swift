//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

public class ActivityDetailsViewController: UIViewController {

    lazy var activityDetailsView: ActivityDetailsView = {

        let activityDetailsView = ActivityDetailsView()
        activityDetailsView.delegate = self
        return activityDetailsView
    }()

    public override func loadView() {
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
