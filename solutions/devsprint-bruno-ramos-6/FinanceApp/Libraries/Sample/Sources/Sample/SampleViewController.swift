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
            case .success(let strings):
                self.customView.display(data: strings)
            case .failure(_):
                self.customView.display(error: SampleViewControllerServiceError())
            }
        }
    }

    public override func loadView() {
        view = customView
    }
}

public struct SampleViewControllerServiceError: Error {}

extension SampleViewController: SampleViewDelegate {
    public func didTapOnConfirmButton() {
        print("user tapped confirm button")
    }
}
