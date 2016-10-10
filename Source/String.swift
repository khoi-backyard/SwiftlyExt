//
//  String.swift
//  SwiftlyExt
//
//  Created by Khoi Lai on 10/10/2016.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import Foundation

public extension String{

    /// Return a date from current string.
    ///
    /// - parameter format: The date format
    /// - parameter locale: The locale. default to `.current`
    ///
    /// - returns: A Date.
    func date(format: String, locale: Locale = .current) -> Date?{
        let df = DateFormatter()
        df.dateFormat = format
        df.locale = locale
        return df.date(from: self)
    }

}
