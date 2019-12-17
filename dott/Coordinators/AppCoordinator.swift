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
    typealias StoreSubscriberStateType = NavigationState

    var rootViewController: UINavigationController

    init(_ rootViewController: UINavigationController){
        self.rootViewController = rootViewController
        
        mainStore.subscribe(self) {
            $0.select {
                $0.navigationState
            }.skip(when: { old, new in
                old.viewState == new.viewState
            })
        }
    }
    
    deinit {
        mainStore.unsubscribe(self)
    }

    func start() {
        let restaurantsVC = RestaurantsViewController.instantiate()
        rootViewController.pushViewController(restaurantsVC, animated: false)
    }
    
    func showDetails() {
        let vc = RestaurantDetailsViewController.instantiate()
        rootViewController.present(vc, animated: true, completion: nil)
    }
    
    func show(error: Error) {
        let alertController = UIAlertController(
            title: "Alert",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            mainStore.dispatch(
                ErrorSeenAction()
            )
        })
        alertController.addAction(cancelAction)
        
        rootViewController.present(alertController, animated: true, completion: nil)
    }
    
    func newState(state: NavigationState) {
        // TODO: (dunyakirkali) Enable again
//        if let error = state.error {
//            show(error: error)
//        }
        
        switch state.viewState {
        case .details:
            showDetails()
        default:
            break
        }
    }
}
