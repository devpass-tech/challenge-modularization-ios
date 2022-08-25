import Foundation

public protocol NetworkManagerProtocol {
    func request(url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

public final class NetworkManager: NetworkManagerProtocol {
    public init() { }

    public func request(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {}
}
