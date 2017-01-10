//
//  CGFloatExtensions.swift
//  SwiftlyExt
//
//  Created by Khoi Lai on 12/30/16.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGFloat {

    /// Convert from degrees to radians
    ///
    /// - Returns: Radian value
    func degreesToRadians() -> CGFloat {
        return (self * .pi) / 180.0
    }

    /// Convert from radians to degrees
    ///
    /// - Returns: Degree value
    func radiansToDegrees() -> CGFloat {
        return (self * 180.0) / .pi
    }

}
