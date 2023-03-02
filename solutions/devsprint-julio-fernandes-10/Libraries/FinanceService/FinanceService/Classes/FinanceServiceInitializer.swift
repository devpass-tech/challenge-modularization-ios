//
//  FinanceServiceInitializer.swift
//  FinanceService
//

import Foundation

public final class FinanceServiceInitializer {
    @discardableResult public class func helloWorld() -> String {
        let message = Localization.Feature.Example.helloWorld
        print(message)
        return message
    }
}
