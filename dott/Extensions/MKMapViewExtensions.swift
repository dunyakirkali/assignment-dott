//
//  MKMapViewExtensions.swift
//  dott
//
//  Created by Dunya Kirkali on 18/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import MapKit

extension MKMapView {
    var northEastCoordinate: CLLocationCoordinate2D {
        return MKMapPoint(x: visibleMapRect.maxX, y: visibleMapRect.minY).coordinate
    }

    var southWestCoordinate: CLLocationCoordinate2D {
        return MKMapPoint(x: visibleMapRect.minX, y: visibleMapRect.maxY).coordinate
    }
}
