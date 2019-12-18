//
//  FourSquareService.swift
//  dottDataKit
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import Moya

public enum FourSquareService {
    case searchVenues(ll: String, sw: String, ne: String)
    case getVenueDetails(venueId: String)
}

extension FourSquareService: TargetType {
    public var baseURL: URL { return URL(string: "https://api.foursquare.com/v2")! }
    public var path: String {
        switch self {
        case .searchVenues:
            return "/venues/search"
        case .getVenueDetails(let venueId):
            return "/venues/\(venueId)"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .searchVenues, .getVenueDetails:
            return .get
        }
    }
    public var task: Task {
        var params: [String: Any] = [:]
        params["client_id"] = config!["API_CLIENT_ID"]
        params["client_secret"] = config!["API_CLIENT_SECRET"]
        params["v"] = "20191216"

        switch self {
        case .searchVenues(let ll, let sw, let ne):
            params["ll"] = ll
            params["limit"] = 50
            params["categoryId"] = "4d4b7105d754a06374d81259"
            params["sw"] = sw
            params["ne"] = ne
            params["intent"] = "browse"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .getVenueDetails:
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    public var sampleData: Data {
        switch self {
        case .searchVenues:
            let asset = NSDataAsset(name: "venues", bundle: Bundle(for: FourSquareClient.self))!
            return String(data: asset.data, encoding: .utf8)!.utf8Encoded
        case .getVenueDetails:
            let asset = NSDataAsset(name: "venue", bundle: Bundle(for: FourSquareClient.self))!
            return String(data: asset.data, encoding: .utf8)!.utf8Encoded
        }
    }
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

private extension FourSquareService {
    var config: NSDictionary? {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
           return NSDictionary(contentsOfFile: path)
        }
        return nil
    }
}
