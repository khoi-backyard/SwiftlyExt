//
//  DateTests.swift
//  Swiftly
//
//  Created by Khoi Lai on 08/10/2016.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import XCTest

class DateTests: XCTestCase {

    let dateFormatter : DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return df
    }()

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
}
