//
//  FourSquareSearchResponse.swift
//  dottDataKit
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

public struct FSResponseBody: Decodable {
    public let venues: [FSVenue]
}
