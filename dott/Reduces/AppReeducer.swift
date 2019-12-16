//
//  AppReeducer.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()

    switch action {
    case let action as LocationChangeAction:
        state.currentLocation = action.location
    case let action as ErrorOccurAction:
        state.error = action.error
    default:
        break
    }

    return state
}
