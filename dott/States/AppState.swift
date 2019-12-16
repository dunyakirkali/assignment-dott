//
//  AppState.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import CoreLocation
import ReSwift
import dottDataKit

struct AppState: StateType {
    /// Keeps the user's current location
    var currentLocation: CLLocation?
    /// Keeps a list of visible Venues
    var venues: [FSVenue] = []
    /// Keeps the current app error
    var error: AppError?
}
