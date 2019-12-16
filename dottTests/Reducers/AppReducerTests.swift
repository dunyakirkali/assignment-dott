//
//  AppReducerTests.swift
//  dottTests
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import XCTest
import CoreLocation
@testable import dott

class AppReducerTests: XCTestCase {
    func testLocationChangeAction() {
        // GIVEN
        let appState = AppState()
        let lat = CLLocationDegrees(exactly: 1.2)!
        let lng = CLLocationDegrees(exactly: 0.1)!
        let location = CLLocation(latitude: lat, longitude: lng)
        
        // WHEN
        let resState = appReducer(action: LocationChangeAction(location: location), state: appState)
        
        // THEN
        XCTAssertEqual(resState.currentLocation, location)
    }
    
    func testErrorOccurAction() {
        // GIVEN
        let appState = AppState()
        let error = AppError.locationRetrievalFailed
        
        // WHEN
        let resState = appReducer(action: ErrorOccurAction(error: error), state: appState)
        
        // THEN
        XCTAssertEqual(resState.error, error)
    }
    
    func testErrorSeenAction() {
        // GIVEN
        let error = AppError.locationRetrievalFailed
        let appState = AppState(currentLocation: nil, venues: [], error: error)
        
        // WHEN
        let resState = appReducer(action: ErrorSeenAction(), state: appState)
        
        // THEN
        XCTAssertNil(resState.error)
    }
}
