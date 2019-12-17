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
        
        focusOnUserLocation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        mainStore.unsubscribe(self)
    }
}

// MARK: - StoreSubscriber
extension RestaurantsViewController: StoreSubscriber {
    func newState(state: AppState) {
        reloadData(venues: state.venues)
    }
}

private extension RestaurantsViewController {
    func focusOnUserLocation() {
        if let location = mainStore.state.currentLocation {
            mapView.setCenter(location.coordinate, animated: true)
        }
    }

    func reloadData(venues: [FSVenue]) {
        mapView.removeAnnotations(mapView.annotations)
        
        for venue in venues {
            let annotaion = IdentifiableAnnotation()
            annotaion.title = venue.name
            annotaion.identifier = venue.id
            annotaion.coordinate = CLLocationCoordinate2D(latitude: venue.location.lat, longitude: venue.location.lng)
            mapView.addAnnotation(annotaion)
        }
    }
}

// MARK: - MKMapViewDelegate
extension RestaurantsViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = mapView.region.center
        
        let lat : NSNumber = NSNumber(value: center.latitude)
        let lng : NSNumber = NSNumber(value: center.longitude)
        
        mainStore.dispatch(
            SeearchAction(query: "\(lat),\(lng)")
        )
        mainStore.dispatch(
            searchVenues
        )
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard
            let annotation = view.annotation as? IdentifiableAnnotation,
            let venue = mainStore.state.venues.first(where: {
                $0.id == annotation.identifier
            })
        else {
            return
        }

        mainStore.dispatch(
            SetVenue(venue: venue)
        )
        mainStore.dispatch(
            NavigationAction(to: .details)
        )
    }
}
