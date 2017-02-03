//
//  SwiftlyTests.swift
//  SwiftlyExt
//
//  Created by Khoi Lai on 1/30/17.
//  Copyright © 2017 Khoi Lai. All rights reserved.
//

import XCTest
@testable import SwiftlyExt

class SwiftlyTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRandom(){
        (0...100).forEach { _ in
            let random = Swiftly.random(lower: 0, upper: 1)
            XCTAssert( [0,1].some{ $0 == random } , "Should return number 0 or 1")
        }

        XCTAssert(Swiftly.random(lower: 2, upper: 2) == 2, "Return the same number if lower == upper")
    }


}
