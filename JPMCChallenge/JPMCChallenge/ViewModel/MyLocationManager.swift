//
//  MyLocationManager.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/15/23.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

@MainActor
class MyLocationManager: NSObject, ObservableObject{
    @Published var currentLocation: CLLocation?
    
    private var locationManager = CLLocationManager()
    
    override init(){
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}


extension MyLocationManager:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        currentLocation = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }


}

extension MKCoordinateRegion{
    static func downtownATL ()-> MKCoordinateRegion{
        return  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.756798, longitude: -84.392367), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }
    
    func getBindingOfRegion() -> Binding<MKCoordinateRegion>?{
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}
