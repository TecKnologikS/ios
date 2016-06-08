//
//  StringLocalizable.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 08/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//

import Foundation


extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
}