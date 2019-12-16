//
//  FourSquareClientProtocol.swift
//  dottDataKit
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import Moya

protocol FourSquareClientProtocol: class {
    static var provider: MoyaProvider<FourSquareService> { get }
}
