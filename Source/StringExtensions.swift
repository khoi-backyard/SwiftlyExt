//
//  StringExtensions.swift
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
    
    
    /// Decoded Base 64 String if applicable
    var base64Decoded: String?{
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }
    
    
    /// Encoded Base 64 String if applicable
    var base64Encoded: String?{
        return data(using: .utf8)?.base64EncodedString()
    }
    
    
    /// Reversed String
    var reversed: String {
        return String(self.characters.reversed())
    }
    
    
    /// A String without white spaces and new lines
    var trimmed: String{
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Decoded URL String
    var urlDecoded: String{
        return removingPercentEncoding ?? self
    }
    
    
    /// Encoded URL String
    var urlEncoded: String{
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
