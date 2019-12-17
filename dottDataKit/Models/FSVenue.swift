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

    public var imageURL: String {
        // TODO: (dunyakirkali) Use the correct image
        return "https://igx.4sqi.net/img/general/300x500/5163668_xXFcZo7sU8aa1ZMhiQ2kIP7NllD48m7qsSwr1mJnFj4.jpg"
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
