//
//  AppCoordinator.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import UIKit

class AppCoordinator {
    var rootViewController: UINavigationController

    init(_ rootViewController: UINavigationController){
        self.rootViewController = rootViewController
    }

    func start() {
        let restaurantsVC = RestaurantsViewController.instantiate()
        rootViewController.pushViewController(restaurantsVC, animated: false)
    }
}
