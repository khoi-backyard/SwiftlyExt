//
//  StringTests.swift
//  SwiftlyExt
//
//  Created by Khoi Lai on 10/10/2016.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {

    let dateFormatString = "dd/MM/yyyy HH:mm:ss"

    override func setUp() {
        super.setUp()
    }

    func testDate(){
        guard let date = "01/01/1970 00:34:22".date(format: dateFormatString) else {
            XCTFail("Can't parse a valid date")
            return
        }
        XCTAssertNil("13/14/1780 14:38:88".date(format: dateFormatString), "Should return nil for invalid date")
        XCTAssertEqual(date.year, 1970)
        XCTAssertEqual(date.month, 1)
        XCTAssertEqual(date.day, 1)
        XCTAssertEqual(date.hour, 0)
        XCTAssertEqual(date.minute, 34)
        XCTAssertEqual(date.second, 22)
        XCTAssertEqual(date.nanosecond, 0)
    }

}
