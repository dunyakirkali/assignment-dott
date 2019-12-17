//
//  FourSquareClient.swift
//  dottDataKit
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import Moya

public class FourSquareClient: FourSquareClientProtocol {
    public static var provider: MoyaProvider<FourSquareService> {
        return MoyaProvider<FourSquareService>()
    }
}
