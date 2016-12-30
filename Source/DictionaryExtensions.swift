//
//  DictionaryExtensions.swift
//  SwiftlyExt
//
//  Created by Khoi Lai on 12/30/16.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import Foundation

public extension Dictionary{
    
    
    init?(fromJsonString json: String){
        guard let data = (try? JSONSerialization.jsonObject(with: json.data(using: String.Encoding.utf8, allowLossyConversion: true)!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? Dictionary else{
            return nil
        }
        self = data
    }

    
    /// Convert from dictionary to Json String
    ///
    /// - Parameter prettify: Pretty printed or not
    /// - Returns: Json String if exist
    func toJsonString(prettify: Bool = false) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: prettify ? .prettyPrinted : JSONSerialization.WritingOptions())  else { return nil }
        let str = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        return String(str ?? "")
    }
    
   
}
