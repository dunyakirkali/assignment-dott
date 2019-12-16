//
//  RestaurantsViewController.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import Reusable
import MapKit
import ReSwift
import Moya

import dottDataKit

class RestaurantsViewController: UIViewController, StoryboardBased {
    
    var req: Cancellable?
    
    // MARK: - Outlets

    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.delegate = self
        }
    }
}

// MARK: - View Lifecycle
extension RestaurantsViewController {
    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }
}

// MARK: - StoreSubscriber
extension RestaurantsViewController: StoreSubscriber {
    func newState(state: AppState) {
        print("\(state.counter)")
    }
}

// MARK: - MKMapViewDelegate
extension RestaurantsViewController: MKMapViewDelegate {
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        
        let center = mapView.region.center
        
        let lat : NSNumber = NSNumber(value: center.latitude)
        let lng : NSNumber = NSNumber(value: center.longitude)
        
        if let r = req {
            r.cancel()
        }
        
        mainStore.dispatch(
            CounterActionIncrease()
        )
        
        let provider = MoyaProvider<FourSquareService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        req = provider.request(.searchVenues(ll: "\(lat),\(lng)")) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data // Data, your JSON response is probably in here!
                let statusCode = moyaResponse.statusCode // Int - 200, 401, 500, etc

                switch statusCode {
                case 200:
                    print(data)
                default:
                    print("ERROR")
                }
                // do something in your app
            case let .failure(error):
                break
                // TODO: handle the error == best. comment. ever.
            }
        }
    }
}
