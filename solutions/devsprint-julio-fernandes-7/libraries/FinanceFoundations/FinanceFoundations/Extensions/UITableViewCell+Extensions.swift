//
//  UITableViewCell+Extensions.swift
//  FinanceFoundations
//
//  Created by Gustavo Fernandes on 07/11/22.
//

import Foundation
import UIKit

extension UITableViewCell {

    class func classIdentifier() -> String {
        guard let className = String(describing: self).components(separatedBy: ".").last else {
            return ""
        }

        return className
    }
}
