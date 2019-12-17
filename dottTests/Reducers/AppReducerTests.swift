//
//  AppReducerTests.swift
//  dottTests
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import XCTest
import CoreLocation
import dottDataKit
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
    
    func testSetVenuesAction() {
        // GIVEN
        let location = FSLocation(lat: 30.0, lng: 4.4)
        let venue = FSVenue(id: "id", name: "name", location: location)
        let venues = [venue]
        let appState = AppState()
        
        // WHEN
        let resState = appReducer(action: SetVenues(venues: venues), state: appState)
        
        // THEN
        XCTAssertEqual(resState.venues.count, 1)
        XCTAssertEqual(resState.venues, venues)
    }
    
    func testSetVenueAction() {
        // GIVEN
        let location = FSLocation(lat: 30.0, lng: 4.4)
        let venue = FSVenue(id: "id", name: "name", location: location)
        let appState = AppState()
        
        // WHEN
        let resState = appReducer(action: SetVenue(venue: venue), state: appState)
        
        // THEN
        XCTAssertEqual(resState.venue, venue)
    }
}
