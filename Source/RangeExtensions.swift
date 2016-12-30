//
//  RangeExtensions.swift
//  Swiftly
//
//  Created by Khoi Lai on 9/19/16.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import Foundation

internal extension CountableRange{

    func each(callback: (Bound) -> ()){
        for i in self {
            callback(i)
        }
    }

    func each(callback: () -> ()){
        for _ in self {
            callback()
        }
    }

    func toArray() -> [Bound]{
        var result = [Bound]();
        self.each { (bound) in
            result.append(bound)
        }
        return result
    }
}

internal extension CountableClosedRange{
    func each(callback: (Bound) -> ()){
        for i in self {
            callback(i)
        }
    }

    func each(callback: () -> ()){
        for _ in self {
            callback()
        }
    }

    func toArray() -> [Bound]{
        var result = [Bound]();
        self.each { (bound) in
            result.append(bound)
        }
        return result
    }

}
