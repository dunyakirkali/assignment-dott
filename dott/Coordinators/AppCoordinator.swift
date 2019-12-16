//
//  AppCoordinator.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import UIKit
import ReSwift

class AppCoordinator: StoreSubscriber {
    typealias StoreSubscriberStateType = AppState

    var rootViewController: UINavigationController

    init(_ rootViewController: UINavigationController){
        self.rootViewController = rootViewController
        
        mainStore.subscribe(self)
    }
    
    deinit {
        mainStore.unsubscribe(self)
    }

    func start() {
        let restaurantsVC = RestaurantsViewController.instantiate()
        rootViewController.pushViewController(restaurantsVC, animated: false)
    }
    
    func show(error: Error) {
        let alertController = UIAlertController(
            title: "Alert",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        
        rootViewController.present(alertController, animated: true, completion: nil)
    }
    
    func newState(state: AppState) {
        if let error = state.error {
            show(error: error)
        }
    }
}
