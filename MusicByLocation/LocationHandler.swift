//
//  LocationHandler.swift
//  MusicByLocation
//
//  Created by Raife Armstrong on 4/3/24.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate, ObservableObject {
    let manager = CLLocationManager()
    let geoceder = CLGeocoder()
    @Published var lastKnownLocation: String = ""
    
    override init(){
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorisation(){
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation(){
        manager.requestLocation()
    }
    
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations: [CLLocation] ){
        if let firstLocation = locations.first{
            geoceder.reverseGeocodeLocation(firstLocation, completionHandler:{(placemarks,error) in
                if error != nil {
                    self.lastKnownLocation = "Could not perform lookup of location from coordinate information"
                } else{
                    if let firstPlacemark = placemarks?[0]{
                        self.lastKnownLocation = firstPlacemark.locality ?? "Couldn't find locality"
                    }
                }
            } )
        } else {
            lastKnownLocation = "No valid location found"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        lastKnownLocation="Error finding location"
    }
}
