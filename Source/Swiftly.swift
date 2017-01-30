//
//  Swiftly.swift
//  SwiftlyExt
//
//  Created by Khoi Lai on 1/30/17.
//  Copyright © 2017 Khoi Lai. All rights reserved.
//

import Foundation

public struct Swiftly {
    /// Return a random integer from lowerbound to upperbound inclusively
    ///
    /// - Parameters:
    ///   - lower: The lower bound
    ///   - upper: The upper bound
    /// - Returns: A random Int
    public static func random(lower: Int = 0, upper: Int = 1) -> Int {
        precondition(upper >= lower, "Lowerbound must be smaller than upper bound")
        return Int(arc4random_uniform(UInt32(upper - lower + 1))) + lower
    }
}
