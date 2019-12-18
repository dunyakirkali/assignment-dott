//
//  MKMapViewExtensionsTests.swift
//  dottTests
//
//  Created by Dunya Kirkali on 18/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import XCTest
import MapKit
@testable import dott

class MKMapViewExtensionsTests: XCTestCase {
    let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    
    override func setUp() {
        super.setUp()
        
        mapView.setCenter(CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), animated: false)
    }

    func testNorthEastCoordinate() {
        XCTAssertEqual(mapView.northEastCoordinate.latitude, 1.411807772604195)
        XCTAssertEqual(mapView.northEastCoordinate.longitude, 1.4119506607231926)
    }
    
    func testSouthWestCoordinate() {
        XCTAssertEqual(mapView.southWestCoordinate.latitude, -1.4118077726042078)
        XCTAssertEqual(mapView.southWestCoordinate.longitude, -1.4119506607231642)
    }
}
