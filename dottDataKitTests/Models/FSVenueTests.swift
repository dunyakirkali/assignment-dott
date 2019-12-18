//
//  FSVenueTests.swift
//  dottDataKitTests
//
//  Created by Dunya Kirkali on 18/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import XCTest
import Moya
@testable import dottDataKit

class FSVenueTests: XCTestCase {
    func testEquatableTrueWhenSameId() {
        let lhsLocation = FSLocation(lat: 30.0, lng: 4.4)
        let rhsLocation = FSLocation(lat: 32.0, lng: 6.4)
        let lhs = FSVenue(id: "id", name: "A", location: lhsLocation)
        let rhs = FSVenue(id: "id", name: "B", location: rhsLocation)
        
        XCTAssertTrue(lhs == rhs)
    }
    
    func testEquatableFalseWhenDifferentId() {
        let lhsLocation = FSLocation(lat: 30.0, lng: 4.4)
        let rhsLocation = FSLocation(lat: 32.0, lng: 6.4)
        let lhs = FSVenue(id: "id", name: "A", location: lhsLocation)
        let rhs = FSVenue(id: "di", name: "B", location: rhsLocation)
        
        XCTAssertFalse(lhs == rhs)
    }
}
