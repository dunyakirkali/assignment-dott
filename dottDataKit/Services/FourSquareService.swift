//
//  FourSquareService.swift
//  dottDataKit
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import Moya

public enum FourSquareService {
    case searchVenues(ll: String)
}

extension FourSquareService: TargetType {
    public var baseURL: URL { return URL(string: "https://api.foursquare.com/v2")! }
    public var path: String {
        switch self {
        case .searchVenues:
            return "/venues/search"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .searchVenues:
            return .get
        }
    }
    public var task: Task {
        switch self {
        case .searchVenues(let ll):
            var params: [String: Any] = [:]
            params["client_id"] = "32RSLGTXVLWUR1PFJUEQCU0MGXPC51YQE4KYM5242N13PAPQ"
            params["client_secret"] = "JNVBUT3T1JRRHOYEAASDSWQ4YYCXMRGKEI15NE1U2COFVEHL"
            params["ll"] = ll
            params["v"] = "20191216"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    public var sampleData: Data {
        switch self {
        case .searchVenues:
            let asset = NSDataAsset(name: "venues", bundle: Bundle(for: FourSquareClient.self))!
            return String(data: asset.data, encoding: .utf8)!.utf8Encoded
        }
    }
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
