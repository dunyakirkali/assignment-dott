//
//  FourSquareClientTests.swift
//  dottDataKitTests
//
//  Created by Dunya Kirkali on 17/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import XCTest
import Moya
@testable import dottDataKit

class FourSquareClientTests: XCTestCase {
    func testSearchVenues() {
        let completedExpectation = expectation(description: "Completed")
        let failedExpectation = expectation(description: "Result count is correct")
        failedExpectation.isInverted = true
        let venueNameExpectation = expectation(description: "Correct name")
        
        let provider = MockFourSquareClient.provider
        
        provider.request(.searchVenues(ll: "0,0")) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = moyaResponse.data
                    let result = try JSONDecoder().decode(FSResponse<[FSVenue]>.self, from: data)
            
                    completedExpectation.fulfill()
                    
                    if
                        let venue = result.response.data.first,
                        venue.name == "Mr. Purple" {
                        venueNameExpectation.fulfill()
                    }
                }
                catch {
                    failedExpectation.fulfill()
                }
            case .failure:
                failedExpectation.fulfill()
            }
        }

        waitForExpectations(timeout: 0.3, handler: nil)
    }
}
