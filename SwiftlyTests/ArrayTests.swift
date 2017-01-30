//
//  ArrayTests.swift
//  Swiftly
//
//  Created by Khoi Lai on 26/09/2016.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import XCTest
import SwiftlyExt

class ArrayTests: XCTestCase {


    var a = [Int]()

    override func setUp() {
        super.setUp()
        a = [1, 2,3, 4,5]
    }

    func testSlice() {
        XCTAssertEqual(a.slice(start: 0, end: 2), [1, 2])
        XCTAssertEqual(a.slice(start: 0), [1, 2, 3, 4, 5])
        XCTAssertEqual(a.slice(start: 3), [4, 5])
        XCTAssertEqual(a.slice(start: 8), [])
        XCTAssertEqual(a.slice(start: 8, end: 10), [])
        XCTAssertEqual(a.slice(start: 1, end: 1), [])
        XCTAssertEqual(a.slice(start: 8, end: 2), [])
        XCTAssertEqual(a.slice(start: 3, end: 3), [])
        XCTAssertEqual(a.slice(start: 2, end: 5), [3, 4,5])
        XCTAssertEqual(a.slice(start: 0, end: 9), [1, 2,3, 4,5])

    }

    func testChunk() {
        XCTAssertEqual([Int]().chunk().count, 0, "chunk for empty array returns an empty array")
        XCTAssertEqual(a.chunk(size: 0).count, 0, "chunk into parts of 0 elements returns empty array")
        XCTAssertEqual(a.chunk(size: -1).count, 0, "chunk into parts of negative amount of elements returns an empty array")
        XCTAssertEqual(a.chunk().count, 0, "defaults to empty array (chunk size 0)")
        XCTAssert(a.chunk(size: 1) == [[1], [2], [3], [4], [5]], "chunk into parts of 1 elements returns original array")
        XCTAssert(a.chunk(size: 5) == [[1, 2, 3, 4, 5]], "chunk into parts of current array length elements returns the original array")
        XCTAssert(a.chunk(size: 7) == [[1, 2, 3, 4, 5]], "chunk into parts of more then current array length elements returns the original array")
        XCTAssert([10, 20, 30, 40, 50, 60, 70].chunk(size: 2) == [[10, 20], [30, 40], [50, 60], [70]], "chunk into parts of less then current array length elements")
        XCTAssert([10, 20, 30, 40, 50, 60, 70].chunk(size: 3) == [[10, 20, 30], [40, 50, 60], [70]], "chunk into parts of less then current array length elements")
    }

    func testDifference() {
        XCTAssertEqual(a.difference([1, 2,3]), [4, 5])
        XCTAssertEqual(a.difference([Int]()), [1, 2,3, 4,5])
        XCTAssertEqual(a.difference([1, 2,3, 4,5]), [])
        XCTAssertEqual(a.difference([1, 2,3, 4,5, 6,8]), [])
    }

    func testDifferenceBy() {
        XCTAssertEqual([3.1, 2.2, 1.3].differenceBy([4.4, 2.5], iteratee: floor), [3.1, 1.3])
    }

    func testDifferenceWith() {
        XCTAssert([["x":1, "y":2], ["x":2, "y":1]].differenceWith([["x":1, "y":2]], comparator: compare) ==  [["x":2, "y":1]])
    }

    func testConcat() {
        XCTAssertEqual(a.concat(values: 6, 7,8), [1, 2,3, 4,5, 6,7, 8])
        XCTAssertEqual(a.concat(arrays: []), [1, 2,3, 4,5])
        XCTAssertEqual(a.concat(arrays: [1, 2], [3, 4], [0], []), [1, 2,3, 4,5, 1,2, 3,4, 0])
    }

    func testDrop() {
        XCTAssertEqual(a.drop(), [2, 3,4, 5], "Should drop first element")
        XCTAssertEqual(a.drop(2), [3, 4,5], "Should drop more than 1 element")
        XCTAssertEqual(a.drop(9), [], "Should drop if n > array length")
        XCTAssertEqual(a.drop(0), [1, 2,3, 4,5], "Should return array if n == 0")
        XCTAssertEqual(a.drop(-1), [1, 2,3, 4,5], "Should return array if n < 0")
    }

    func testDropRight() {
        XCTAssertEqual(a.dropRight(), [1, 2,3, 4], "Should drop last element")
        XCTAssertEqual(a.dropRight(2), [1, 2,3], "Should drop more than 1 element")
        XCTAssertEqual(a.dropRight(9), [], "Should drop if n > array count")
        XCTAssertEqual(a.dropRight(0), [1, 2,3, 4,5], "Should return array if n == 0")
        XCTAssertEqual(a.dropRight(-1), [1, 2,3, 4,5], "Should return array if n < 0")
    }

    func testDropWhile() {
        XCTAssertEqual(a.dropWhile { $0 < 3 }, [3, 4,5], "Should drop elements")
        XCTAssertEqual(a.dropWhile { _ in return false }, [1, 2,3, 4,5])
        XCTAssertEqual(a.dropWhile { _ in return true }, [])
    }

    func testDropRightWhile() {
        XCTAssertEqual(a.dropRightWhile { $0 > 3 }, [1, 2, 3], "Should drop elements")
        XCTAssertEqual(a.dropRightWhile { _ in return false }, [1, 2,3, 4,5])
        XCTAssertEqual(a.dropRightWhile { _ in return true }, [])
    }

    func testFindIndex() {
        XCTAssertEqual(a.findIndex {$0 % 2 == 0}, 1, "Should find first index")
        XCTAssertEqual([1, 2,2].findIndex {$0 % 2 == 0}, 1, "Should return the first index")
        XCTAssertNil(a.findIndex {$0 > 5}, "Should return nil if not found")
    }

    func testFindLastIndex() {
        XCTAssertEqual(a.findLastIndex {$0 % 2 == 0}, 3, "Should find last index")
        XCTAssertEqual([1, 2,2].findLastIndex {$0 % 2 == 0}, 2, "Should return the last index")
        XCTAssertNil(a.findLastIndex {$0 > 5}, "Should return nil if not found")
    }

    func testIntersection() {
        XCTAssertEqual([2, 1].intersection([4, 2], [1, 2]), [2], "Should return the array of common elements")
        XCTAssertEqual([2, 7,5, 1].intersection([5, 9,4, 2], [5, 10, 1,2]), [2, 5], "Should return the array of common elements")
        XCTAssertEqual(a.intersection([1, 2,3, 4,5]), [1, 2,3, 4,5], "Should return the array")
        XCTAssertEqual(a.intersection([Int]()), [], "Should return blank array")
    }

    func testIntersectionBy() {
        XCTAssertEqual([2.1, 1.2].intersectionBy([4.3, 2.4], iteratee: floor), [2.1], "Should intersect with one array")
        XCTAssertEqual([2.1, 1.2].intersectionBy([4.5, 3.4, 2.3], [2.8, 3.2, 4.7], iteratee: floor), [2.1], "Should intersect with more than 1 array")
    }

    func testIntersectionWith() {
        let objects1 = [["x":1, "y":2], ["x":2, "y":1]]
        let objects2 = [["x":1, "y":1], ["x":1, "y":2]]
        XCTAssert(objects1.intersectionWith(objects2, comparator: compare) == [["x":1, "y":2]])
    }

    func testEvery() {
        XCTAssert([true, true, true].every { $0 == true }, "every true values")
        XCTAssertFalse([true, false, true].every { $0 == true }, "one false value")

        var count = 0
        XCTAssert([0, 10, 28].every {
            count += 1
            return $0 % 2 == 0
        }, "Even number")

        XCTAssert(count == 3, "Runtime \(count) should be 3")

        count = 0

        XCTAssertFalse([0, 11, 28, 10].every {
            count += 1
            return $0 % 2 == 0
        }, "An odd number")

        XCTAssert(count == 2, "Runtime \(count) should be 1")
    }

    func testSome() {
        XCTAssert([false, true, false].some { $0 == true }, "one true value")
        XCTAssertFalse([false, false, false].some { $0 == true }, "all false value")


        var count = 0

        XCTAssert([11, 23, 25, 26].some {
            count += 1
            return $0 % 2 == 0 }, "Even number at the end")
        XCTAssert(count == 4, "Runtime \(count) should be 4")

        count = 0
        XCTAssert([0, 11, 28, 10].some {
            count += 1
            return $0 % 2 == 0
        }, "An odd number")
        XCTAssert(count == 1, "Runtime \(count) should be 1")
    }

    func testXor() {
        let objects1 = [["x":1, "y":2], ["x":2, "y":1]]
        let objects2 = [["x":1, "y":1], ["x":1, "y":2]]



        XCTAssert([Int].xor(arrays: [2, 1], [4, 2]) == [1, 4])
        XCTAssert([Int].xor(arrays: []) == [])
        XCTAssert([Int].xor(arrays: [1, 2,3], [4, 5,6]) == [1, 2,3, 4,5, 6])
        XCTAssert([Double].xorBy(arrays: [2.1, 1.2], [4.3, 2.4], iteratee: floor) == [1.2, 4.3])
        XCTAssert([Dictionary<String, Int>].xorWith(arrays: objects1, objects2, comparator: compare) == [["x":2, "y":1], ["x":1, "y":1]])
    }

    func testWithout() {
        XCTAssert([1, 2, 1, 0, 3, 1, 4].without(0, 1) == [2, 3,4])

    }

    func testShuffle() {
        XCTAssert([1].shuffled() == [1], "Behave correctly with 1 element")

        let oneToTwentys = Array(1...20)
        let shuffled = oneToTwentys.shuffled()
        XCTAssert(shuffled != oneToTwentys, "does change the order") // Chance of false negative: 1 in ~2.4*10^18
        XCTAssert(oneToTwentys == shuffled.sorted(), "Same number of elements and value after sorted")
    }
    
    func testRandomAndSample() {
        let a = [0, 1]
        (0...100).forEach { _ in
            let rand = a.random()
            let sample = a.sample()
            XCTAssert(a.some { $0 == rand }, "Must be either 0 or 1")
            XCTAssert(a.some { $0 == sample }, "Same goes for sample")
        }
        
        
    }
    
    func testsampleSize() {
        let a = [0,1,2,3,4,5]
        
        XCTAssert(a.sampleSize() == [], "Default must be zero")
        XCTAssert(a.sampleSize(0) == [], "passing 0 should works too")
        XCTAssert(a.sampleSize(-10) == [], "Negative size works")
        
        (0...10).forEach{ _ in
            let numberOfElement = Swiftly.random(lower: 0, upper: a.count - 1)
            XCTAssert(a.sampleSize(numberOfElement).every{ aSample in
                return a.some {$0 == aSample}
            }, "Taking samples should work")
        }
        
    }
}


fileprivate func compare(obj1: [String:Int], obj2: [String:Int]) -> Bool {
    return obj1["x"] == obj2["x"] && obj1["y"] == obj2["y"]
}

fileprivate func ==(lhs: [[String: Int]], rhs: [[String: Int]]) -> Bool {
    guard lhs.count == rhs.count else { return false }
    var currentIdx = 0
    while currentIdx < lhs.count {
        if !compare(obj1: lhs[currentIdx], obj2: rhs[currentIdx]) {
            return false
        }
        currentIdx += 1
    }
    return true
}

fileprivate func ==(lhs: [[Int]], rhs: [[Int]]) -> Bool {
    guard lhs.count == rhs.count else { return false }
    var currentIdx = 0
    while currentIdx < lhs.count {
        if lhs[currentIdx] != rhs[currentIdx] {
            return false
        }
        currentIdx += 1
    }
    return true
}
