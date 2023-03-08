//
//  UserProfileInitializer.swift
//  UserProfile
//

import Foundation
import UserProfileInterface

public final class UserProfileInitializer {
   
    private let localizationString: String
    public init(localizationString: String) {
        self.localizationString = localizationString
    }
    
}

extension UserProfileInitializer: UserProfileInterface {
    
    @discardableResult public func helloWorld() -> String {
        let message = localizationString + Localization.Feature.Example.helloWorld
        print(message)
        return message
    }

}
