//
//  AppCoordinatorTests.swift
//  dottTests
//
//  Created by Dunya Kirkali on 18/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import XCTest
@testable import dott

class AppCoordinatorTests: XCTestCase {
    func testStartLoadsRestaurantsViewController() {
        // GIVEN
        let navigationController = UINavigationController()
        let coordinator = AppCoordinator(navigationController)
        
        // WHEN
        coordinator.start()
        
        // THEN
        XCTAssertTrue(coordinator.rootViewController.topViewController! is RestaurantsViewController)
    }
    
    func testShowDetailsLoadsRestaurantDetailsViewController() {
        // GIVEN
        let navigationController = UINavigationController()
        let coordinator = AppCoordinator(navigationController)
        
        // WHEN
        coordinator.showDetails()
        
        // THEN
        XCTAssertTrue(coordinator.rootViewController.topViewController! is RestaurantDetailsViewController)
    }
}
