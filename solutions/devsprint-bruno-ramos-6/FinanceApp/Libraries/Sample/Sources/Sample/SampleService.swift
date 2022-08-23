import Alamofire
import Foundation

public protocol SampleServiceProtocol {
    func fetch(completion: @escaping (Result<[String], Error>) -> Void)
}

public final class SampleService: SampleServiceProtocol {
    public init() {
        
    }

    public func fetch(completion: @escaping (Result<[String], Error>) -> Void) {
        AF.request("https://httpbin.org/get").response { _ in
            DispatchQueue.main.async {
                completion(.success(["foo", "bar", "xyz"]))
            }
        }
    }
}

public final class SampleServiceDois: SampleServiceProtocol {
    public init() { }

    public func fetch(completion: @escaping (Result<[String], Error>) -> Void) {
        guard !StaticData.data.isEmpty else {
            return completion(.failure(SampleEmptyDataSource()))
        }

        completion(.success(StaticData.data))
    }
}

struct SampleEmptyDataSource: Error { }

final class StaticData {
    static var data: [String] = ["foo", "bar", "xyz"]
}
