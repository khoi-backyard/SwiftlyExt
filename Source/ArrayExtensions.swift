//
//  ArrayExtensions.swift
//  Swiftly
//
//  Created by Khoi Lai on 26/09/2016.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import Foundation

public extension Array {
    /// Create an array of elements split in to groups by the length of size.
    /// If array can't be split evenly, the final chunk contains all the remain elements.
    /// - parameter size: The length of each chunk. 0 by default.
    ///
    /// - returns: The new array contains chunks
    func chunk(size: Int = 0) -> [[Element]] {
        var result = [[Element]]()
        if size < 1 {
            return result
        }
        let length = self.count
        var i = 0
        while i < length {
            let start = i
            i += size
            result.append(self.slice(start: start, end: i))
        }
        return result
    }

    /// Creates a new array concatenating additional values.
    ///
    /// - parameter values: The values to concatenate.
    ///
    /// - returns: The new concatenated array.
    func concat(values: Element...) -> [Element] {
        var result = Array(self)
        result.append(contentsOf: values)
        return result
    }

    /// This method is like difference except that it accepts comparator which is invoked to compare elements of array to values.
    ///
    /// - parameter values:     The values to exclude.
    /// - parameter comparator: The comparator invoked per element.
    ///
    /// - returns: Returns the new array of filtered values.
    func differenceWith(_ values: [Element], comparator: (Element, Element) -> Bool) -> [Element] {
        return self._baseDifference(with: values, comparator: comparator, iteratee: nil)
    }

    /// Creates a new array concatenating additional arrays.
    ///
    /// - parameter arrays: The arrays to concatenate.
    ///
    /// - returns: The new concatenated array.
    func concat(arrays: [Element]...) -> [Element] {
        var result = Array(self)
        for arr in arrays {
            result.append(contentsOf: arr)
        }
        return result
    }

    /// Creates a new sliced array with n elements dropped from the beginning.
    ///
    /// - parameter n: The number of elements to drop. default to `1`
    ///
    /// - returns: Returns the new sliced array.
    func drop(_ n: Int = 1) -> [Element] {
        return self.slice(start: Swift.max(n, 0), end: self.count)
    }

    /// Creates a slice of array with n elements dropped from the end.
    ///
    /// - parameter n: The number of elements to drop.
    ///
    /// - returns: Returns the new sliced array.
    func dropRight(_ n: Int = 1) -> [Element] {
        let end = self.count - n
        return self.slice(start: 0, end: end < 0 ? 0 : end)
    }

    ///  Creates a slice of array excluding elements dropped from the end. Elements are dropped until predicate returns false.
    ///
    /// - parameter predicate: The function invoked per iteration.
    ///
    /// - returns: Returns the new sliced array.
    func dropRightWhile(predicate: (Element) -> Bool) -> [Element] {
        return self._baseWhile(predicate: predicate, isDrop: true, fromRight: true)
    }

    /// Creates a slice of array excluding elements dropped from the beginning. Elements are dropped until predicate returns false.
    ///
    /// - parameter predicate: The function invoked per iteration.
    ///
    /// - returns: Returns the new sliced array.
    func dropWhile(predicate: (Element) -> Bool) -> [Element] {
        return self._baseWhile(predicate: predicate, isDrop: true)
    }

    /// Returns true if all of the values in the array pass the predicate test. Stop traversing the list once a falsey value found.
    ///
    /// - Parameter predicate: The function invoked per iteration.
    /// - Returns: Boolean
    func every(predicate: (Element) -> Bool) -> Bool {
        for elem in self {
            if !predicate(elem) {
                return false
            }
        }
        return true
    }

    /// Returns the index of the first element predicate returns true for.
    ///
    /// - parameter predicate: The function invoked per iteration.
    ///
    /// - returns: Returns the index of the found element, else nil.
    func findIndex(predicate: (Element) -> Bool) -> Int? {
        return _baseFindIndex(predicate: predicate)
    }

    /// This method is like .findIndex except it iterates over the elements of array from right to left.
    ///
    /// - parameter predicate: The function invoked per iteration.
    ///
    /// - returns: Returns the index of the found element, else nil.
    func findLastIndex(predicate: (Element) -> Bool) -> Int? {
        return _baseFindIndex(predicate: predicate, fromRight: true)
    }

    /// This method is like .intersection except that it accepts comparator which is invoked to compare elements of arrays.
    ///
    /// - parameter arrays:     The arrays to inspect.
    /// - parameter comparator: The comparator invoked per element.
    ///
    /// - returns: Returns the new array of shared values.
    func intersectionWith(_ arrays: [Element]..., comparator: (Element, Element) -> Bool) -> [Element] {
        return self._baseIntersection(arrays: arrays, comparator: comparator)
    }

    /// Return an array by slicing from start up to, but not including, end.
    ///
    /// - parameter start: The start position.
    /// - parameter end:   The end position. `nil` by default
    ///
    /// - returns: The sliced array
    func slice(start: Int, end: Int? = nil) -> [Element] {
        let end = Swift.min(end ?? self.count, self.count)
        if start > self.count || start > end {
            return []
        }
        return Array(self[start..<end])
    }

    /// Returns true if all of the values in the array pass the predicate test. Stop traversing the list once a true-ful value found.
    ///
    /// - Parameter predicate: The function invoked per iteration.
    /// - Returns: Boolean
    func some(predicate: (Element) -> Bool) -> Bool {
        for elem in self {
            if predicate(elem) {
                return true
            }
        }
        return false
    }

    /// Returns a shuffled copy of the array, using a version of the Fisher-Yates shuffle.
    ///
    /// - Returns: Returns the new shuffled array.
    func shuffled() -> [Element] {
        var newArray = Array(self)
        newArray.shuffle()
        return newArray
    }

    /// Shuffle the elements of the collection in place.
    mutating func shuffle() {
        for index in 0..<self.count {
            let randIndex = Int(arc4random_uniform(UInt32(self.count - 1)))
            if index != randIndex { Swift.swap(&self[index], &self[randIndex]) }
        }
    }

    /// This method is like .xor except that it accepts comparator which is invoked to compare elements of arrays.
    ///
    /// - Parameters:
    ///   - arrays: The arrays to inspect.
    ///   - comparator: The comparator invoked per element.
    /// - Returns: Returns the new array of values.
    static func xorWith(arrays: [Element]..., comparator: (Element, Element) -> Bool) -> [Element] {
        return _baseXor(arrays: arrays, isXorBy:false, comparator:comparator)
    }
}

// MARK: Element: Equatable
public extension Array where Element: Equatable {

    /// Creates an array of unique array values not included in the other provided arrays.
    ///
    /// - parameter values: The values to exclude.
    ///
    /// - returns: Returns the new array of filtered values.
    func difference(_ values: [Element]) -> [Element] {
        return self._baseDifference(with: values, comparator: ==)
    }

    /// This method is like difference except that it accepts iteratee which is invoked for each element of array and values to generate the criterion by which uniqueness is computed.
    ///
    /// - parameter values:   The values to exclude.
    /// - parameter iteratee: The iteratee invoked per element.
    ///
    /// - returns: Returns the new array of filtered values.
    func differenceBy(_ values: [Element], iteratee: @escaping ((Element) -> Element)) -> [Element] {
        return self._baseDifference(with: values, comparator: ==, iteratee: iteratee)
    }

    /// Creates an array of unique values that are included in all of the provided arrays.
    ///
    /// - parameter arrays: The arrays to inspect.
    ///
    /// - returns: Returns the new array of shared values.
    func intersection(_ arrays: [Element]...) -> [Element] {
        return self._baseIntersection(arrays: arrays, comparator: ==)
    }

    ///  This method is like .intersection except that it accepts iteratee which is invoked for each element of each arrays to generate the criterion by which uniqueness is computed.
    ///
    /// - parameter arrays:   The arrays to inspect.
    /// - parameter iteratee: The iteratee invoked per element.
    ///
    /// - returns: Returns the new array of shared values.
    func intersectionBy(_ arrays: [Element]..., iteratee: @escaping (Element) -> Element) -> [Element] {
        return self._baseIntersection(arrays: arrays, comparator: ==, iteratee: iteratee)
    }

    /// Creates an array excluding all given values using == comparator
    ///
    /// - Parameter values: The values to exclude.
    /// - Returns: Returns the new array of filtered values.
    func without(_ values: Element...) -> [Element] {
        return _baseDifference(with: values, comparator: ==)
    }

    /// Creates an array of unique values that is the symmetric difference of the provided arrays.
    ///
    /// - Parameter arrays: The arrays to inspect.
    /// - Returns: Returns the new array of values.
    static func xor(arrays: [Element]...) -> [Element] {
        return _baseXor(arrays: arrays, isXorBy: false, comparator: ==, iteratee: nil)
    }

    /// This method is like .xor except that it accepts iteratee which is invoked for each element of each arrays to generate the criterion by which uniqueness is computed.
    ///
    /// - Parameters:
    ///   - arrays: The arrays to inspect.
    ///   - iteratee: The iteratee invoked per element.
    /// - Returns: Returns the new array of values.
    static func xorBy(arrays: [Element]..., iteratee: @escaping ((Element) -> Element)) -> [Element] {
        return _baseXor(arrays: arrays, isXorBy: true, comparator: ==, iteratee: iteratee)
    }
}

// MARK: fileprivate helper methods
fileprivate extension Array {
    func _baseDifference(with values: [Element],
                         comparator: (Element, Element) -> Bool,
                         iteratee: ((Element) -> Element)? = nil) -> [Element] {
        var result = [Element]()
        for elem1 in self {
            var isUnique = true
            let val1 = iteratee != nil ? iteratee!(elem1) : elem1
            for elem2 in values {
                let val2 = iteratee != nil ? iteratee!(elem2) : elem2
                if comparator(val1, val2) {
                    isUnique = false
                    break
                }
            }
            if isUnique { result.append(elem1) }
        }
        return result
    }

    func _baseWhile(predicate: ((Element) -> Bool),
                    isDrop: Bool = false,
                    fromRight: Bool = false) -> [Element] {
        let length = self.count
        var index = fromRight ? length : -1

        repeat {
            index += fromRight ? -1 : 1
        } while (fromRight ? index >= 0 : index < length) && predicate(self[index])

        return isDrop ? self.slice(start: fromRight ? 0 : index, end: fromRight ? index + 1 : length) : self.slice(start: fromRight ? index + 1 : 0, end: fromRight ? length : index)
    }

    func _baseFindIndex(predicate: ((Element) -> Bool),
                        fromRight: Bool = false) -> Int? {
        let length = self.count

        let strideRange = fromRight ? stride(from: length - 1, to: 0, by: -1) : stride(from: 0, to: length - 1, by: 1)

        for i in strideRange {
            if predicate(self[i]) { return i }
        }

        return nil
    }

    func _baseIntersection(arrays: [[Element]],
                            comparator: (Element, Element) -> Bool,
                            iteratee: ((Element) -> Element)? = nil) -> [Element] {
        var result = self

        for i in 0..<arrays.count {
            var tmp = [Element]()
            for elem1 in result {
                var isCommonElem = false
                let val1 = iteratee != nil ? iteratee!(elem1) : elem1
                for elem2 in arrays[i] {
                    let val2 = iteratee != nil ? iteratee!(elem2) : elem2
                    if comparator(val1, val2) {
                        isCommonElem = true
                        break
                    }
                }
                if isCommonElem {
                    tmp.append(elem1)
                }
            }
            result = tmp
            if result.isEmpty { break }
        }
        return result
    }

    static func _baseXor<T>(arrays: [[T]], isXorBy: Bool, comparator: (T, T) -> Bool, iteratee: ((T) -> T)?=nil) -> [T] {
        guard !arrays.isEmpty else { return [] }
        guard arrays.count > 1 else { return arrays[0] }

        var result = arrays[arrays.count - 1]

        for i in (0...arrays.count - 2).reversed() {
            let nextArr = arrays[i]
            var tmp = [T]()
            var uniqueElemMarker = [Bool](repeating: true, count: result.count)

            for elem1 in nextArr {
                var isUnique = true
                for j in 0..<result.count {
                    let elem2 = result[j]
                    if isXorBy {
                        if let iteratee = iteratee {
                            if comparator(iteratee(elem1), iteratee(elem2)) {
                                isUnique = false
                                uniqueElemMarker[j] = false
                                break
                            } else {
                                continue
                            }
                        }
                    }

                    if comparator(elem1, elem2) {
                        isUnique = false
                        uniqueElemMarker[j] = false
                        break
                    }
                }

                if isUnique {
                    tmp.append(elem1)
                }
            }

            for i in 0..<result.count {
                if uniqueElemMarker[i] {
                    tmp.append(result[i])
                }
            }

            result = tmp
        }

        return result
    }
}
