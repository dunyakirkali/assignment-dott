//
//  FourSquareResponse.swift
//  dottDataKit
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

public struct FSResponse<T: Decodable>: Decodable {
    let meta: FSMeta
    public let response: FSResponseBody<T>
}
