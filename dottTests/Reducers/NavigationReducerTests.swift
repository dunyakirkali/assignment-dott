//
//  NavigationReducerTests.swift
//  dottTests
//
//  Created by Dunya Kirkali on 17/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import XCTest
@testable import dott

class NavigationReducerTests: XCTestCase {
    func testInitializesAnEmptyNavigationStateWhenNonGiven() {
        // GIVEN
        // NOOP
        
        // WHEN
        let resState = navigationReducer(action: NavigationAction(to: .details), state: nil)
        
        // THEN
        XCTAssertEqual(resState.viewState, .details)
    }
    
    func testInitialViewState() {
        // GIVEN
        let navState = NavigationState()
        
        // WHEN
        // NOOP
        
        // THEN
        XCTAssertEqual(navState.viewState, .map)
    }

    func testNavigationAction() {
        // GIVEN
        let navState = NavigationState()
        
        // WHEN
        let resState = navigationReducer(action: NavigationAction(to: .details), state: navState)
        
        // THEN
        XCTAssertEqual(resState.viewState, .details)
    }
}
