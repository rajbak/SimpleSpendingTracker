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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let dateTime = formatter.date(from: "2017/10/08 22:31")
        
        let dateString = dateTime?.toDateString(style: .short)
        
        XCTAssertEqual("08/10/2017", dateString)
    }
}
