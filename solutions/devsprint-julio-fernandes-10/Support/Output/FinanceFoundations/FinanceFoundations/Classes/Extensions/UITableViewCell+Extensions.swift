//
//  UITableViewCell+Extensions.swift
//  FinanceFoundations
//
//  Created by Philippe Muniz Gomes on 03/03/23.
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
