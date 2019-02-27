//
//  LocationService.swift
//  FineDust_Copy
//
//  Created by 승진김 on 27/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager {
    
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    private init() {
        checkAuthorizationStatus()
    }
    
    var currentLocation: CLLocation? {
        return locationManager.location
    }
    
    func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse, .authorizedAlways:
            updatingLocation()
        }
    }
    
    private func updatingLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.startUpdatingLocation()
    }
    
    func isUseLocationService() -> Bool {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined, .authorizedAlways, .authorizedWhenInUse:
            return true
        case .restricted, .denied:
            return false
        }
    }
    
    func reverseGeocoderLocation(completionHandler: @escaping (CLPlacemark) -> ()) {
        guard let location = locationManager.location else { return }
        
        geocoder.reverseGeocodeLocation(location) { placeMark, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            guard let placeMark = placeMark?.first else { return }
            
            completionHandler(placeMark)
        }
    }
    
}
