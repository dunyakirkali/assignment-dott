//
//  FSPhoto.swift
//  dottDataKit
//
//  Created by Dunya Kirkali on 18/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

public struct FSPhoto: Decodable {
    let id: String
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
    
    public var imageURL: String {
        return "\(prefix)\(width)x\(height)\(suffix)"
    }
}
