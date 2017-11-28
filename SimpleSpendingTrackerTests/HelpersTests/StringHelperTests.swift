//
//  StringHelperTests.swift
//  SimpleSpendingTrackerTests
//
//  Created by rajbak on 25/11/2017.
//  Copyright © 2017 rajbak. All rights reserved.
//

import XCTest
@testable import SimpleSpendingTracker

class StringHelperTests: XCTestCase {

    func test_isNumeric_WhenStringIsNotNumber_ReturnsFalse() {
        let string = "ABCKASD";
        
        let isNumeric = StringHelper.isNumeric(string)
        
        XCTAssert(isNumeric == false)
    }
    
    func test_isNumeric_WhenStringIsNotNumberButContainsNumber_ReturnsFalse() {
        let string = "ABCK12ASD";
        
        let isNumeric = StringHelper.isNumeric(string)
        
        XCTAssert(isNumeric == false)
    }
    
    func test_isNumeric_WhenStringIsInteger_ReturnsTrue() {
        let string = "12";
        
        let isNumeric = StringHelper.isNumeric(string)
        
        XCTAssert(isNumeric)
    }
    
    func test_isNumeric_WhenStringIsDecimalWithDot_ReturnsTrue() {
        let double = 12.1
        let string = localizedDecimalString(from: double)
        
        let isNumeric = StringHelper.isNumeric(string)
        
        XCTAssert(isNumeric)
    }
    
    private func localizedDecimalString(from double: Double) -> String {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
       
        if let string = formatter.string(from: NSNumber(value: double)) {
            return string
        } else {
            return ""
        }
    }
}
