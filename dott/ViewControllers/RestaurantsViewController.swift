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
        super.viewWillAppear(animated)

        mainStore.subscribe(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchVenues()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        mainStore.unsubscribe(self)
    }
}

// MARK: - StoreSubscriber
extension RestaurantsViewController: StoreSubscriber {
    func newState(state: AppState) {
        if let location = state.currentLocation {
            mapView.setCenter(location.coordinate, animated: true)
        }
        reloadData(venues: state.venues)
    }
}

private extension RestaurantsViewController {
    func reloadData(venues: [FSVenue]) {
        mapView.removeAnnotations(mapView.annotations)
        
        for venue in venues {
            let annotaion = MKPointAnnotation()
            annotaion.title = "London"
            annotaion.coordinate = CLLocationCoordinate2D(latitude: venue.location.lat, longitude: venue.location.lng)
            mapView.addAnnotation(annotaion)
        }
    }
    
    func fetchVenues() {
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
                    let result = try JSONDecoder().decode(FSResponse.self, from: data)
                    
                    mainStore.dispatch(
                        SetVenues(venues: result.response.venues)
                    )
                }
                catch {
                    mainStore.dispatch(
                        ErrorOccurAction(error: AppError.jsonError)
                    )
                }
            case .failure:
                mainStore.dispatch(
                    ErrorOccurAction(error: AppError.networkError)
                )
            }
        }
    }
}

// MARK: - MKMapViewDelegate
extension RestaurantsViewController: MKMapViewDelegate {
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        // TODO: (dunyakirkali) Implement
    }
}
