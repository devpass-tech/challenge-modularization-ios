//
//  Feature1Initializer.swift
//  Feature1
//

import Foundation
import Feature1Interface

public final class Feature1Initializer {
   
    private let localizationString: String
    public init(localizationString: String) {
        self.localizationString = localizationString
    }
    
}

extension Feature1Initializer: Feature1Interface {
    
    @discardableResult public func helloWorld() -> String {
        let message = localizationString + Localization.Feature.Example.helloWorld
        print(message)
        return message
    }

}
