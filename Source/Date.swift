//
//  Date.swift
//  Swiftly
//
//  Created by Khoi Lai on 08/10/2016.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import Foundation

public extension Date{
    /// Check if self is before input date.
    ///
    /// - parameter date: The date to compare to.
    ///
    /// - returns: True if self is before input date, false otherwise.
    func isBefore(_ date: Date) -> Bool{
        return self.compare(date) == .orderedAscending
    }

    /// Check if self is after input date.
    ///
    /// - parameter date: The date to compare to.
    ///
    /// - returns: True if self is after input date, false otherwise.
    func isAfter(_ date: Date) -> Bool{

        return self.compare(date) == .orderedDescending
    }
}
