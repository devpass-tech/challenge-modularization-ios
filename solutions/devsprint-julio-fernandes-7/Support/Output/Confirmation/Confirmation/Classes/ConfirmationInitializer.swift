//
//  ConfirmationInitializer.swift
//  Confirmation
//

import Foundation

public final class ConfirmationInitializer {
    
    @discardableResult public class func helloWorld() -> String {
        let message = Localization.Feature.Example.helloWorld
        print(message)
        return message
    }
    
}