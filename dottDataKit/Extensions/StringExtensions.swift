//
//  StringExtensions.swift
//  dottDataKit
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
