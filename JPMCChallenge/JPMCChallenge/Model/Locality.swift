//
//  Locality.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/15/23.
//

import Foundation
import CoreLocation


struct Locality: Identifiable{
    var id: String{
        return dbn
    }
    
    let dbn: String
    let name: String
    var coordinate: CLLocationCoordinate2D
}


extension Locality{
    init(school:School){
        self.dbn = school.dbn
        self.name = school.schoolName
        self.coordinate = CLLocationCoordinate2D(latitude: Double(school.latitude ?? "33.756798") ?? 33.756798, longitude: Double(school.longitude ?? "-84.392367") ?? -84.392367)
    }
}
