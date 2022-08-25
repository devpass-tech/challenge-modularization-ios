import UIKit

public final class SampleViewController: UIViewController {
    private let customView: SampleViewProtocol & UIView
    private let service: SampleServiceProtocol

    public init(customView: SampleViewProtocol & UIView, service: SampleServiceProtocol) {
        self.customView = customView
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    public func fetchData() {
        service.fetch { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let activities):
                self.customView.display(viewModel: activities.map(SampleView.ViewModel.init))
            case .failure(let error):
                self.customView.display(error: error)
            }
        }
    }

    public override func loadView() {
        view = customView
    }
}

extension SampleViewController: SampleViewDelegate {
    public func didTapOnConfirmButton() {
        print("user tapped confirm button")
    }
}
