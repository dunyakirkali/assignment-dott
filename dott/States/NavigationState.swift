//
//  NavigationState.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import ReSwift

struct NavigationState: StateType {
    /// Keeps the current VC
    var viewState: ViewState = .map
}

enum ViewState {
    case map
    case details
}
