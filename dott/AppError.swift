//
//  AppError.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import Foundation

enum AppError: Error {
    case locationRetrievalFailed
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .locationRetrievalFailed:
            return "Failed to retrieve location!"
        }
    }
}

