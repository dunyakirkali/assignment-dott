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
    
    func testErrorOccurAction() {
        // GIVEN
        let appState = NavigationState()
        let error = AppError.locationRetrievalFailed
        
        // WHEN
        let resState = navigationReducer(action: ErrorOccurAction(error: error), state: appState)
        
        // THEN
        XCTAssertEqual(resState.error, error)
    }
    
    func testErrorSeenAction() {
        // GIVEN
        let error = AppError.locationRetrievalFailed
        let appState = NavigationState(error: error, viewState: .map)
        
        // WHEN
        let resState = navigationReducer(action: ErrorSeenAction(), state: appState)
        
        // THEN
        XCTAssertNil(resState.error)
    }
}
