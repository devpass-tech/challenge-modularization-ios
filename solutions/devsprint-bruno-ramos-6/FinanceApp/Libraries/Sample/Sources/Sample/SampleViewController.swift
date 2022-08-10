import UIKit
import Alamofire

public final class SampleViewController: UIViewController {
    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
    }

    public override func loadView() {
        view = SampleView()
    }
}
