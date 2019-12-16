//
//  AppErrorTests.swift
//  dottTests
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import XCTest
@testable import dott

class AppErrorTests: XCTestCase {
    func testErrorCount() {
        XCTAssertEqual(AppError.allCases.count, 3)
    }
    
    func testErrorDescriptionWhenLocationRetrievalFailed() {
        let error = AppError.locationRetrievalFailed
        XCTAssertEqual(error.localizedDescription, "Failed to retrieve location!")
    }
}
