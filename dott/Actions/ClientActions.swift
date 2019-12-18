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

    let provider = FourSquareClient.provider
    req = provider.request(.searchVenues(ll: query)) { result in
        switch result {
        case let .success(moyaResponse):
            do {
                let data = moyaResponse.data
                let result = try JSONDecoder().decode(FSResponse<[FSVenue]>.self, from: data)
                
                mainStore.dispatch(
                    SetVenues(venues: result.response.data)
                )
            }
            catch {
                mainStore.dispatch(
                    ErrorOccurAction(error: AppError.jsonError)
                )
                break
            }
        case .failure:
//            mainStore.dispatch(
//                ErrorOccurAction(error: AppError.networkError)
//            )
            break
        }
        req = nil
    }

    return nil
}

func getVenueDetails(state: AppState, store: Store<AppState>) -> Action? {
    guard let venue = state.venue else { return nil }
    let provider = FourSquareClient.provider
    provider.request(.getVenueDetails(venueId: venue.id)) { result in
        switch result {
        case let .success(moyaResponse):
            do {
                let data = moyaResponse.data
                let result = try JSONDecoder().decode(FSResponse<FSVenue>.self, from: data)
                
                mainStore.dispatch(
                    SetVenue(venue: result.response.data)
                )
            }
            catch {
                mainStore.dispatch(
                    ErrorOccurAction(error: AppError.jsonError)
                )
//                break
            }
        case .failure:
//            mainStore.dispatch(
//                ErrorOccurAction(error: AppError.networkError)
//            )
            break
        }
    }

    return nil
}
