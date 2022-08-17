//
//  URLSessionProtocol.swift
//  FinanceApp
//
//  Created by pedro tres on 17/08/22.
//

import Foundation

protocol URLSessionProtocol {
    func loadData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: URLSessionProtocol {
    func loadData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let dataTask = dataTask(with: request, completionHandler: completionHandler)
        dataTask.resume()
    }
}
