//
//  FourSquareSearchResponse.swift
//  dottDataKit
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

public struct FSResponseBody<T: Decodable>: Decodable {
    public let data: T
    
    private enum CodingKeys : String, CodingKey {
        case data
        
        public var stringValue: String {
            switch String(describing: T.self) {
                case "Array<FSVenue>": return "venues"
                case "FSVenue": return "venue"
                default: return "data"
            }
        }
    }
}
