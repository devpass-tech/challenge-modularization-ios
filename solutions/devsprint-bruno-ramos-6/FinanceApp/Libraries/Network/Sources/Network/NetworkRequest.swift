//
//  NetworkRequest.swift
//  FinanceApp
//
//  Created by pedro tres on 17/08/22.
//

import Foundation

protocol NetworkRequest {
    var baseURL: String { get }
    var pathURL: String { get }
    var method: HTTPMethod { get }
}

enum HTTPMethod: String {
    case get
}
