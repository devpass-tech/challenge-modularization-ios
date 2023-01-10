//
//  Feature2Initializer.swift
//  Feature2
//

import Foundation
import Feature2Interface

public final class Feature2Initializer {
   
    private let localizationString: String
    public init(localizationString: String) {
        self.localizationString = localizationString
    }
    
}

extension Feature2Initializer: Feature2Interface {
    
    @discardableResult public func helloWorld() -> String {
        let message = localizationString + Localization.Feature.Example.helloWorld
        print(message)
        return message
    }

}
