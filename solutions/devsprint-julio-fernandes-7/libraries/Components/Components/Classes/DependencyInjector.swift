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
    func forceResolve<Service>(_ service: Service.Type) -> Service
}

extension Container: DependencyInjectorInterface {
    public func forceResolve<Service>(_ service: Service.Type) -> Service {
        guard let resolve = self.resolve(service) else {
            fatalError("Depedência não resolvida")
        }
        return resolve
    }
}
