//
//  MockFourSquareClient.swift
//  dottDataKitTests
//
//  Created by Dunya Kirkali on 17/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import Moya
@testable import dottDataKit

class MockFourSquareClient: FourSquareClientProtocol {
    static var provider: MoyaProvider<FourSquareService> {
        return MoyaProvider<FourSquareService>(stubClosure: MoyaProvider.immediatelyStub)
    }
}
