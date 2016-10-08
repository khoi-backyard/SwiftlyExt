//
//  Int.swift
//  Swiftly
//
//  Created by Khoi Lai on 9/19/16.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import Foundation

public extension Int {
    /// Convert current int to an [Int]
    ///
    /// - returns: An array of digits
    func digits() -> [Int]{

        var digits: [Int] = []
        var curr = self

        while curr > 0 {
            digits.append(curr % 10)
            curr /= 10
        }

        return digits.reversed()
    }

    /// Invoke the callback with indexes from current int down to and including n.
    ///
    /// - parameter lowBound: The lowBound to go to
    /// - parameter callback: The block to invoke with current index
    func downTo(_ lowBound: Int, callback: (Int) -> Void){
        var curr = self
        while curr >= lowBound{
            callback(curr)
            curr -= 1
        }
    }

    /// Return the factorial of int
    ///
    /// - returns: Factorial of int
    func factorial() -> Int {
        guard self > 0 else { return 1 }
        return self * (self - 1).factorial()
    }

    /// Check if the integer is even.
    ///
    /// - returns: Bool whether the int is even
    func isEven() -> Bool{
        return self % 2 == 0
    }

    /// Test whether the int is in a range
    ///
    /// - parameter range: The range to check
    ///
    /// - returns: BOOL whether the int is in range
    func isIn(range: Range<Int>) -> Bool{
        return range ~= self
    }

    /// Test whether the int is in a range
    ///
    /// - parameter range: The range to check
    ///
    /// - returns: BOOL whether the int is in range
    func isIn(range: ClosedRange<Int>) -> Bool{
        return range ~= self
    }

    /// Check if the integer is odd.
    ///
    /// - returns: Bool whether the int is odd
    func isOdd() -> Bool{
        return !isEven()
    }

    /// Invoke the callback function n times with zero-based indexes.
    ///
    /// - parameter callback: The block with current index
    func times(_ callback: (Int) -> Void){
        guard self > 0 else { return }
        (0..<self).each { (idx) in
            callback(idx)
        }
    }

    /// Invoke the callback with indexes from current int up to and including n.
    ///
    /// - parameter upBound:  The upbound to go to
    /// - parameter callback: The block to invoke with current index
    func upTo(_ upBound: Int, callback: (Int) -> Void){
        guard self <= upBound else { return }
        (self...upBound).each { (idx) in
            callback(idx)
        }
    }
}

