//
//  ClientActions.swift
//  dott
//
//  Created by Dunya Kirkali on 17/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import ReSwift
import Moya

import dottDataKit

var req: Cancellable?

struct SeearchAction: Action {
    let query: String
}

func searchVenues(state: AppState, store: Store<AppState>) -> Action? {
    
    guard let query = state.clientState.query else { return nil }
    
    if let r = req {
        r.cancel()
    }

    let provider = MoyaProvider<FourSquareService>()
    req = provider.request(.searchVenues(ll: query)) { result in
        switch result {
        case let .success(moyaResponse):
            do {
                let data = moyaResponse.data
                let result = try JSONDecoder().decode(FSResponse.self, from: data)
                
                mainStore.dispatch(
                    SetVenues(venues: result.response.venues)
                )
            }
            catch {
                mainStore.dispatch(
                    ErrorOccurAction(error: AppError.jsonError)
                )
            }
        case .failure:
            break
//                mainStore.dispatch(
//                    ErrorOccurAction(error: AppError.networkError)
//                )
        }
    }

    return nil
}
