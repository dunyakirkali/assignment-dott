//
//  RestaurantDetailsViewControllerTests.swift
//  dottTests
//
//  Created by Dunya Kirkali on 17/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import XCTest
import CoreLocation
import dottDataKit
@testable import dott

class RestaurantDetailsViewControllerTests: XCTestCase {
    func testNewState() {
        // GIVEN
        let location = FSLocation(lat: 30.0, lng: 4.4)
        let venue = FSVenue(id: "id", name: "name", location: location)
        let appState = AppState(currentLocation: nil, venues: [], navigationState: NavigationState(error: nil, viewState: .details), venue: venue)
        let vc = RestaurantDetailsViewController.instantiate()
        vc.loadView()
        
        // WHEN
        vc.newState(state: appState)
        
        // THEN
        XCTAssertEqual(vc.nameLabel.text, venue.name)
    }
}
