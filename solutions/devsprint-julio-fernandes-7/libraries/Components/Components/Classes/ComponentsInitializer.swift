//
//  ComponentsInitializer.swift
//  Components
//

import Foundation

public final class ComponentsInitializer {
    
    @discardableResult public class func helloWorld() -> String {
        let message = Localization.Feature.Example.helloWorld
        print(message)
        return message
    }
}
