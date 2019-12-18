//
//  ClientReducer.swift
//  dott
//
//  Created by Dunya Kirkali on 17/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import ReSwift

func clientReducer(action: Action, state: ClientState?) -> ClientState {
    var state = state ?? ClientState()

    switch action {
    case let action as SearchAction:
        state.query = action.query
        state.ne = action.ne
        state.sw = action.sw
    default:
        break
    }

    return state
}
