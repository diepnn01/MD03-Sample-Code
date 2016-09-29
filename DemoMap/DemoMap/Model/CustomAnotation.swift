//
//  CustomAnotation.swift
//  DemoMap
//
//  Created by Điệp Nguyễn on 6/13/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit
import MapKit

class CustomAnotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var longtitude:Double?
    var latitude:Double?
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(self.latitude!, self.longtitude!)
    }
    
    init(latitude: Double, longtitude: Double) {
        self.latitude = latitude
        self.longtitude = longtitude
    }
}
