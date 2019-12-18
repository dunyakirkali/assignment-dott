//
//  Venue.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

public struct FSVenue: Decodable {
    public let id: String
    public let name: String
    public let location: FSLocation
    public var description: String?
    public var bestPhoto: FSPhoto?

    public var imageURL: String? {
        return bestPhoto?.imageURL
    }
    
    public init(id: String, name: String, location: FSLocation) {
        self.id = id
        self.name = name
        self.location = location
    }
}

extension FSVenue: Equatable {
    public static func == (lhs: FSVenue, rhs: FSVenue) -> Bool {
        return lhs.id == rhs.id
    }
}
