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
        if let location = state.currentLocation {
            mapView.setCenter(location.coordinate, animated: true)
        }
        reloadData(venues: state.restaurants)
    }
}

private extension RestaurantsViewController {
    func reloadData(venues: [Venue]) {
        mapView.removeAnnotations(mapView.annotations)
        
        for venue in venues {
//            let annotaion = MKPointAnnotation()
//            annotaion.title = "London"
//            annotaion.coordinate = CLLocationCoordinate2D(latitude: venue.location.lat, longitude: venue.location.lng)
//            mapView.addAnnotation(annotaion)
        }
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
        
        let provider = MoyaProvider<FourSquareService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        req = provider.request(.searchVenues(ll: "\(lat),\(lng)")) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = moyaResponse.data
                    let result = try JSONDecoder().decode(FourSquareResponse<Venue>.self, from: data)
                    print(result)
                }
                catch let error {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
