//
//  FSLocation.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

public struct FSLocation: Decodable {
    public let lat: Double
    public let lng: Double
    
    public init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
}
