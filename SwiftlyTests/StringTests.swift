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
    
    func testInitials(){
        XCTAssert("John Doe".initials == "JD")
        XCTAssert("John With Middle Name Doe".initials == "JWMND")
    }
    
    func testIsEmail(){
        XCTAssertTrue("swift@swiftly.com".isEmail)
        XCTAssertFalse("swift@@swiftly.com".isEmail)
    }
    
    func testCount(){
        XCTAssert("Swiftlylylyly ly".count("as") == 0)
        XCTAssert("Swiftlylylyly ly".count("ly") == 5)
    }
    
    func testBetween(){
        XCTAssert("<a>foo</a>".between("<a>", "</a>") == "foo")
        XCTAssert("<a><a>foo</a></a>".between("<a>", "</a>") == "<a>foo</a>")
        XCTAssert("<a>foo".between("<a>", "</a>") == nil)
        XCTAssert("Some strings } are very {weird}, dont you think?".between("{", "}") == "weird")
        XCTAssert("<a></a>".between("<a>", "</a>") ==  nil)
        XCTAssert("<a>foo</a>".between("<a>", "<a>") ==  nil)
    }

    func testDate() {
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

    func testBase64Encode() {
        XCTAssert("a".base64Encoded == "YQ==", "2 padding chars")
        XCTAssert("aa".base64Encoded == "YWE=", "1 padding char")
        XCTAssert("aaa".base64Encoded == "YWFh", "0 padding char")
        XCTAssert("foo\0".base64Encoded == "Zm9vAA==", "U+0000")
        XCTAssert("foo\0\0".base64Encoded == "Zm9vAAA=", "0 padding char")
        XCTAssert("https://github.com/Swiftly".base64Encoded == "aHR0cHM6Ly9naXRodWIuY29tL1N3aWZ0bHk=")
    }

    func testBase64Decode() {
        XCTAssert("aHR0cHM6Ly9naXRodWIuY29tL1N3aWZ0bHk=".base64Decoded == "https://github.com/Swiftly")
    }

    func testReversed() {
        XCTAssert("Swiftly".reversed == "yltfiwS")
        XCTAssert("abcdef".reversed == "fedcba")
        XCTAssert("a".reversed == "a")
        XCTAssert("".reversed == "")
    }

    func testTrimmed() {
        XCTAssert("\r\n\n\n Swiftly    \r\n\n".trimmed == "Swiftly")
        XCTAssert("\n\n\n Swiftly    ".trimmed.reversed == "yltfiwS")
    }

    func testURLEncoded() {
        XCTAssert("abcd".urlEncoded == "abcd", "String must be unchanged")
        XCTAssert("\n\t".urlEncoded == "%0A%09")
        XCTAssert("Swiftly\t\nString\nTest".urlEncoded == "Swiftly%09%0AString%0ATest")
    }

    func testURLDecoded() {
        XCTAssert("https%3A%2F%2Fgithub.com%2Fkhoiln%2FSwiftlyEXT".urlDecoded == "https://github.com/khoiln/SwiftlyEXT")
    }
    
    func testHasNumbers(){
        XCTAssertTrue("hoho2".hasNumbers)
        XCTAssertFalse("swiftly".hasNumbers)
    }
    
    func testHasLetters(){
        XCTAssertFalse("12389723".hasLetters)
        XCTAssertTrue("3749347a98423".hasLetters)
        XCTAssertFalse("!@#$%^&*()🐶".hasLetters)
    }
    
    func testIsAlpha(){
        XCTAssertFalse("fdafaf3".isAlpha)
        XCTAssert("afaf".isAlpha)
        XCTAssertFalse("dfda@#(*&@#dfd".isAlpha)
    }
    
    func testIsAlphaNumeric() {
        XCTAssert("afaf35353afaf".isAlphaNumeric)
        XCTAssert("FFFF99fff".isAlphaNumeric)
        XCTAssert("99".isAlphaNumeric)
        XCTAssert("afff".isAlphaNumeric)
        XCTAssertFalse("-33".isAlphaNumeric)
        XCTAssertFalse("aaff..".isAlphaNumeric)
    }
}
