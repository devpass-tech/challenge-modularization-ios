//
//  DI.swift
//  Components
//
//  Created by Julio Fernandes on 10/11/22.
//

import Foundation
import Swinject

public final class DependencyInjector {
    public static let container: Container = Container()
}

public protocol DependencyInjectorInterface: AnyObject {
    func forceResolve<Service>(_ serviceType: Service.Type) -> Service
}

extension Container: DependencyInjectorInterface {
    public func forceResolve<Service>(_ serviceType: Service.Type) -> Service {
        guard let resolve = self.resolve(serviceType) else {
            let expected = String(describing: serviceType)
            fatalError("""
            DependencyInjectorInterface: Resolution failed. Expected registration:,
            \t{ \(expected) },
            Available registrations:,
            """)
        }
        return resolve
    }
}
