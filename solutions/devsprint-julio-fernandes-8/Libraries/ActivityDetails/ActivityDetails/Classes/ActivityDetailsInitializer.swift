//
//  ActivityDetailsInitializer.swift
//  ActivityDetails
//

import Foundation

public final class ActivityDetailsInitializer {
    
    @discardableResult public class func helloWorld() -> String {
        let message = Localization.Feature.Example.helloWorld
        print(message)
        return message
    }
    
}
