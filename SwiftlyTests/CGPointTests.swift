//
//  CGPointTests.swift
//  SwiftlyExt
//
//  Created by Khoi Lai on 12/30/16.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import XCTest

class CGPointTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDistance(){
        XCTAssert(CGPoint(x: 0, y: 0).distance(to: CGPoint(x: 0, y: 0)) == 0)
        XCTAssert(CGPoint(x: 4, y: 4).distance(to: CGPoint(x: 4, y: 4)) == 0)
        XCTAssert(CGPoint(x: 2, y: 8).distance(to: CGPoint(x: 5, y: 4)) == 5)
    }
    
}
