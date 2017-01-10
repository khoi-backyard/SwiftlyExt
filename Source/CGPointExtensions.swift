//
//  CGPointExtensions.swift
//  SwiftlyExt
//
//  Created by Khoi Lai on 12/30/16.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGPoint {

    /// Calculate distance from self to another point.
    ///
    /// - Parameter to: destination point
    /// - Returns: distance between two points.
    func distance(to point: CGPoint) -> CGFloat {
        return CGPoint.distance(from: self, to: point)
    }

    /// Calculate distance between 2 CGPoint.
    ///
    /// - Parameters:
    ///   - from: origin point
    ///   - to: destination point
    /// - Returns: distance between two points.
    static func distance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt(pow(to.x - from.x, 2) + pow(to.y - from.y, 2))
    }
}
