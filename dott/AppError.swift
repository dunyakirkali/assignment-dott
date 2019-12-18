//
//  AppError.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import Foundation

enum AppError: Error, CaseIterable {
    case locationRetrievalFailed
    case networkError
    case rateError
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .locationRetrievalFailed:
            return "Failed to retrieve location!"
        case .networkError:
            return "Something went wrong! Please try again later."
        case .rateError:
            return "Rate limit reached!"
        }
    }
}

