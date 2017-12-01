//
//  DateExtensionsTests.swift
//  SimpleSpendingTrackerTests
//
//  Created by rajbak on 01/12/2017.
//  Copyright © 2017 rajbak. All rights reserved.
//

import XCTest
@testable import SimpleSpendingTracker

class DateExtensionsTests: XCTestCase {
    
    func test_toDateString_WhenDateHasTime_ReturnsDataStringOnly() {
        // arrange
        let now = Date()
        let style = DateFormatter.Style.short
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.timeStyle = .none
        let expectedDate = formatter.string(from: now)
        
        // act
        let dateString = now.toDateString(style: style)

        // assert
        XCTAssertEqual(expectedDate, dateString)
    }
}
