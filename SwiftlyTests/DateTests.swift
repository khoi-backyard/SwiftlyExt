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

    func testBefore() {
        XCTAssert(currentDate.isBefore(futureDate!))
        XCTAssertFalse(currentDate.isBefore(pastDate!))
        XCTAssertFalse(currentDate.isBefore(sameDate!))
    }

    func testAfter() {
        XCTAssert(currentDate.isAfter(pastDate!))
        XCTAssertFalse(currentDate.isAfter(futureDate!))
        XCTAssertFalse(currentDate.isAfter(sameDate!))
    }

    func testCustomInit() {
        XCTAssertNotNil(Date(from: "01/01/1970 00:34:22", format: dateFormatString), "Should return a valid date")
        XCTAssertNil(Date(from: "01/34/1970 00:34:22", format: dateFormatString), "Should return a invalid date")
    }

    func testCustomerProperty() {
        let aDate = Date(from: "01/01/1970 00:34:22", format: dateFormatString)
        XCTAssertEqual(aDate?.era, 1)
        XCTAssertEqual(aDate?.year, 1970)
        XCTAssertEqual(aDate?.month, 1)
        XCTAssertEqual(aDate?.day, 1)
        XCTAssertEqual(aDate?.hour, 00)
        XCTAssertEqual(aDate?.minute, 34)
        XCTAssertEqual(aDate?.second, 22)
        XCTAssertEqual(aDate?.weekday, 5)
    }

    func testStringFormat() {
        let aDate = Date(from: "30/12/2016 14:34:22", format: dateFormatString)
        XCTAssertEqual(aDate?.toString(format: dateFormatString), "30/12/2016 14:34:22")
        XCTAssertEqual(aDate?.toString(format: "MMM yyyy"), "Dec 2016")
    }

    func testAddingDate() {
        let aDate = Date(from: "30/12/2016 14:34:22", format: dateFormatString)
        XCTAssertEqual(aDate?.date(byAddingYears: 1)?.year, 2017)
        XCTAssertEqual(aDate?.date(byAddingYears: -1)?.year, 2015)

        XCTAssertEqual(aDate?.date(byAddingMonths: 1)?.year, 2017, "Should switch to next year if current month is 12")
        XCTAssertEqual(aDate?.date(byAddingMonths: 1)?.month, 1)
        XCTAssertEqual(aDate?.date(byAddingMonths: -1)?.month, 11)

        XCTAssertEqual(aDate?.date(byAddingDays: 1)?.day, 31)
        XCTAssertEqual(aDate?.date(byAddingDays: 2)?.day, 1)
        XCTAssertEqual(aDate?.date(byAddingDays: -1)?.day, 29)

        XCTAssertEqual(aDate?.date(byAddingHours: 1)?.hour, 15)
        XCTAssertEqual(aDate?.date(byAddingHours: -1)?.hour, 13)
        XCTAssertEqual(aDate?.date(byAddingHours: 10)?.hour, 0)
        XCTAssertEqual(aDate?.date(byAddingHours: 10)?.day, 31)

        XCTAssertEqual(aDate?.date(byAddingMinutes: 1)?.minute, 35)
        XCTAssertEqual(aDate?.date(byAddingMinutes: -1)?.minute, 33)
        XCTAssertEqual(aDate?.date(byAddingMinutes: 26)?.hour, 15)
        XCTAssertEqual(aDate?.date(byAddingMinutes: 26)?.minute, 0)

        XCTAssertEqual(aDate?.date(byAddingSeconds: 1)?.second, 23)
        XCTAssertEqual(aDate?.date(byAddingSeconds: -1)?.second, 21)
        XCTAssertEqual(aDate?.date(byAddingSeconds: 38)?.second, 0)
        XCTAssertEqual(aDate?.date(byAddingSeconds: 38)?.minute, 35)
    }
}
