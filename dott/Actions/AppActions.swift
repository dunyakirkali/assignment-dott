//
//  AppActions.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import CoreLocation
import ReSwift
import dottDataKit

/// Triggered when the user's location has changed
struct LocationChangeAction: Action {
    let location: CLLocation
}

/// Triggered when an error occurs
struct ErrorOccurAction: Action {
    let error: AppError
}

/// Triggered when the user dismisses an alert
struct ErrorSeenAction: Action {}

/// Triggered when venues have been fetched
struct SetVenues: Action {
    let venues: [FSVenue]
}
