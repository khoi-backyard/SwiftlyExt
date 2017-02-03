//
//  CGFloatTests.swift
//  SwiftlyExt
//
//  Created by Khoi Lai on 12/30/16.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import XCTest

class CGFloatTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDegreeToRadians() {
        XCTAssert(CGFloat(180).degreesToRadians() == CGFloat.pi)
    }

    func testRadiansToDegrees() {
        XCTAssert(CGFloat(CGFloat.pi).radiansToDegrees() == 180)

    }
}
