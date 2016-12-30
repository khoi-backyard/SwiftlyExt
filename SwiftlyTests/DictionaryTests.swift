//
//  DictionaryTests.swift
//  SwiftlyExt
//
//  Created by Khoi Lai on 12/30/16.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import XCTest

class DictionaryTests: XCTestCase {
    
    
    typealias JSONDict = [String: Any]
    
    let jsonString = "{\"list\":[1234,45.234],\"number\":5443.1,\"name\":\"Swiftly\",\"object\":{\"sub_number\":877.2323,\"sub_name\":\"SwiftlySub\"},\"bool\":true}"

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testInitFromJSON(){
        let dict = JSONDict(fromJsonString: jsonString)!
        XCTAssert((dict["number"] as! Double) == 5443.1)
        XCTAssert((dict["name"] as! String) == "Swiftly")
        XCTAssert((dict["list"] as! [Any])[0] as! Int == 1234)
        XCTAssert((dict["list"] as! [Any])[1] as! Double == 45.234)
        XCTAssert((dict["object"] as! JSONDict)["sub_number"] as! Double == 877.2323)
        XCTAssert((dict["object"] as! JSONDict)["sub_name"] as! String == "SwiftlySub")
        XCTAssert(dict["bool"] as! Bool)
    }
    

}
