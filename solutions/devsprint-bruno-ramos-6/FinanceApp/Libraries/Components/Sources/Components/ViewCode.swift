import UIKit

public protocol ViewCode: UIView {
    func setupComponents()
    func setupConstraints()
    func setupExtraConfiguration()
    func setup()
}

public extension ViewCode {
    func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }
    
    func setupExtraConfiguration() { }
}
