//
//  IntTests.swift
//  IntTests
//
//  Created by Khoi Lai on 9/19/16.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import XCTest
import SwiftlyExt

class IntTests: XCTestCase {

    override func setUp() {
        super.setUp()

        1.upTo(3) { print($0) }
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTimes() {
        var count = 0

        5.times{ _ in
            count += 1
        }
        XCTAssertEqual(count, 5)

        var zero = 0
        0.times { _ in
            zero += 1
        }
        XCTAssertEqual(zero, 0)


        (-9).times{ _ in
            zero += 1
        }
        XCTAssertEqual(zero, 0)

    }

    func testTimesWithIndex(){
        var indexes = [Int]()

        5.times { (idx) in
            indexes.append(idx)
        }

        XCTAssertEqual(indexes, [0,1,2,3,4])
    }

    func testOddAndEven(){
        XCTAssert(4.isEven())
        XCTAssert(0.isEven())
        XCTAssertFalse(1.isEven())
        XCTAssertFalse(3.isEven())

        XCTAssertFalse(4.isOdd())
        XCTAssertFalse(0.isOdd())
        XCTAssert(1.isOdd())
        XCTAssert(3.isOdd())
    }

    func testUpTo(){
        var count = 0
        0.upTo(5) { _ in
            count += 1
        }
        XCTAssertEqual(count, 6)

        var zero = 0
        0.upTo(-1) { _ in
            zero += 1
        }
        XCTAssertEqual(zero, 0)

        12.upTo(-1) { _ in
            zero += 1
        }
        XCTAssertEqual(zero, 0)

        var indexes = [Int]()

        0.upTo(5) { (idx) in
            indexes.append(idx)
        }

        XCTAssertEqual(indexes, [0,1,2,3,4,5])
    }


    func testDownTo(){
        var count = 0
        5.downTo(0){ _ in
            count += 1
        }
        XCTAssertEqual(count, 6)

        var zero = 0
        (-1).downTo(0) { _ in
            zero += 1
        }
        XCTAssertEqual(zero, 0)

        (-1).downTo(12) { _ in
            zero += 1
        }
        XCTAssertEqual(zero, 0)

        var indexes = [Int]()
        5.downTo(0) { (idx) in
            indexes.append(idx)
        }
        XCTAssertEqual(indexes, [5,4,3,2,1,0])
    }



    func testDigits(){
        XCTAssertEqual(1234.digits(), [1,2,3,4])
        XCTAssertEqual(01234.digits(), [1,2,3,4])
    }

    func testIsIn(){
        XCTAssert(0.isIn(range: 0..<200))
        XCTAssertFalse(200.isIn(range: 0..<200))
        XCTAssertFalse((-1).isIn(range: 0..<200))

        XCTAssert(0.isIn(range: 0...200))
        XCTAssert(200.isIn(range: 0...200))
        XCTAssertFalse((-1).isIn(range: 0...200))
        XCTAssertFalse(201.isIn(range: 0...200))
    }

    func testFactorial(){
        XCTAssertEqual(5.factorial(), 120)
        XCTAssertEqual(10.factorial(), 3628800)
        XCTAssertEqual(0.factorial(), 1)


    }
}
