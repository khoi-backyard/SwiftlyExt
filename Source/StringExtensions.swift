//
//  StringExtensions.swift
//  SwiftlyExt
//
//  Created by Khoi Lai on 10/10/2016.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import Foundation

public extension String {

    /// Find the string between two string.
    ///
    /// - Parameters:
    ///   - left: The left bookend
    ///   - right: The right bookend
    /// - Returns: Return the String if found else `nil`
    func between(_ left: String, _ right: String) -> String? {
        guard let leftRange = range(of: left),
            let rightRange = range(of: right, options: .backwards),
            left != right && leftRange.upperBound != rightRange.lowerBound else {
                return nil
        }
        return self[leftRange.upperBound...index(before: rightRange.lowerBound)]
    }

    /// Count number of occurences for a substring
    ///
    /// - Parameter str: The string to count
    /// - Returns: Number of occurences
    func count(_ str: String) -> Int {
        return components(separatedBy: str).count - 1
    }

    /// Return a date from current string.
    ///
    /// - parameter format: The date format
    /// - parameter locale: The locale. default to `.current`
    ///
    /// - returns: A Date.
    func date(format: String, locale: Locale = .current) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        df.locale = locale
        return df.date(from: self)
    }

    /// Check whether the string is an email or not.
    var isEmail: Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }

    /// Check whether the string contains one or more letters.
    public var hasLetters: Bool {
        return rangeOfCharacter(from: .letters, options: .literal) != nil
    }

    /// Check whether the string contains one or more numbers.
    public var hasNumbers: Bool {
        return rangeOfCharacter(from: .decimalDigits, options: .literal) != nil
    }

    /// Check whether the string contains only letters.
    var isAlpha: Bool {
        for c in characters {
            if !(c >= "a" && c <= "z") && !(c >= "A" && c <= "Z") {
                return false
            }
        }
        return true
    }

    /// Check if string contains at least one letter and one number
    var isAlphaNumeric: Bool {
        return components(separatedBy: .alphanumerics).joined(separator: "").characters.isEmpty
    }

    /// Return the initials of the String
    var initials: String {
        return self.components(separatedBy: " ").reduce("") { $0 + $1[0...0] }
    }

    /// Decoded Base 64 String if applicable
    var base64Decoded: String? {
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }

    /// Encoded Base 64 String if applicable
    var base64Encoded: String? {
        return data(using: .utf8)?.base64EncodedString()
    }

    /// Reversed String
    var reversed: String {
        return String(self.characters.reversed())
    }

    /// A String without white spaces and new lines
    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Decoded URL String
    var urlDecoded: String {
        return removingPercentEncoding ?? self
    }

    /// Encoded URL String
    var urlEncoded: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }

}

extension String {
    subscript (r: CountableClosedRange<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            return self[startIndex...endIndex]
        }
    }
}
