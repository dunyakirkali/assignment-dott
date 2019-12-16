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
    var currentLocation: CLLocation?
    var restaurants: [Venue] = []
    var error: AppError?
}
