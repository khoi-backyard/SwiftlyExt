//
//  DateTests.swift
//  Swiftly
//
//  Created by Khoi Lai on 08/10/2016.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import XCTest

class DateTests: XCTestCase {


    let dateFormatString = "dd/MM/yyyy HH:mm:ss"

    let currentDate = Date()

    var sameDate: Date?
    var futureDate: Date?
    var pastDate: Date?


    let calendar = Calendar.current

    override func setUp() {
        super.setUp()
        sameDate = calendar.date(byAdding: .day, value: 0, to: currentDate)
        futureDate = calendar.date(byAdding: .day, value: 1, to: currentDate)
        pastDate = calendar.date(byAdding: .day, value: -1, to: currentDate)
    }

    func testBefore(){
        XCTAssert(currentDate.isBefore(futureDate!))
        XCTAssertFalse(currentDate.isBefore(pastDate!))
        XCTAssertFalse(currentDate.isBefore(sameDate!))
    }

    func testAfter(){
        XCTAssert(currentDate.isAfter(pastDate!))
        XCTAssertFalse(currentDate.isAfter(futureDate!))
        XCTAssertFalse(currentDate.isAfter(sameDate!))
    }

    func testCustomInit(){
        XCTAssertNotNil(Date(from: "01-01-1970 00:34:22", format: dateFormatString), "Should return a valid date")
        XCTAssertNil(Date(from: "01-34-1970 00:34:22", format: dateFormatString), "Should return a valid date")
    }

    func testCustomerProperty(){
        let aDate = Date(from: "30-12-1970 14:34:22", format: dateFormatString)
        XCTAssertEqual(aDate?.era, 1)
        XCTAssertEqual(aDate?.year, 1970)
        XCTAssertEqual(aDate?.month, 12)
        XCTAssertEqual(aDate?.day, 30)
        XCTAssertEqual(aDate?.hour, 14)
        XCTAssertEqual(aDate?.minute, 34)
        XCTAssertEqual(aDate?.second, 22)
        XCTAssertEqual(aDate?.weekday, 4)
    }
}
