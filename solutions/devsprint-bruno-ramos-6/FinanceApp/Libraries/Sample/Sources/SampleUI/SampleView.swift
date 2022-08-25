import UIKit
import SampleDomain

public protocol SampleViewDelegate: AnyObject {
    func didTapOnConfirmButton()
}

public protocol SampleViewProtocol {
    func display(viewModel: [SampleView.ViewModel])
    func display(error: Error)
}

public final class SampleView: UIView {
    public struct ViewModel {
        let activityName: String
        let activityValue: Double

        init(from domain: Activity) {
            self.activityName = domain.name
            self.activityValue = domain.value
        }
    }

    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "DevPass Sample Module"
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(didTapOnConfirmButton), for: .touchUpInside)
        return button
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    public weak var delegate: SampleViewDelegate?

    public init() {
        super.init(frame: .zero)
        setupSubViews()
        setupConstraints()
        setupExtraConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setupSubViews() {
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(descriptionLabel)
        containerStackView.addArrangedSubview(imageView)
        addSubview(containerStackView)
        addSubview(confirmButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),

            confirmButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            confirmButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            confirmButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            confirmButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func setupExtraConfiguration() {
        backgroundColor = .white
    }

    @objc
    private func didTapOnConfirmButton() {
        delegate?.didTapOnConfirmButton()
    }
}

extension SampleView: SampleViewProtocol {
    public func display(viewModel: [ViewModel]) {
        print(viewModel)
    }

    public func display(error: Error) {
        print(error)
    }
}
