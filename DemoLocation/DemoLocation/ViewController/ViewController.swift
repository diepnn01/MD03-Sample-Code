//
//  ViewController.swift
//  DemoLocation
//
//  Created by Điệp Nguyễn on 6/13/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var currentLocation = CLLocationCoordinate2D()
    var myRoute : MKRoute?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        self.mapView.delegate = self
        
        let routeBtn = UIBarButtonItem(title: "Route", style: .Done, target: self, action: #selector(ViewController.route))
        self.navigationItem.rightBarButtonItem = routeBtn
    }
    
    // get latest user location
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        let location = locations.last
        self.currentLocation = (manager.location?.coordinate)!;
        self.zoomToRegion((location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
    }
    
    // zoom to specify location
    func zoomToRegion(latitude: Double, longitude: Double) -> Void {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegionMakeWithDistance(location, 5000.0, 7000.0)
        self.mapView.setRegion(region, animated: true)
    }
    
    // chỉ đường giữa 2 điểm
    func route() -> Void {
        
        let address = "136 Minh Khai, Hà Nội, Việt Nam"
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            if((error) != nil){
                print("Error", error)
            }
            if let placemark = placemarks?.first {
                let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                
                let annotation = CustomAnotation(latitude: coordinates.latitude, longtitude: coordinates.longitude)
                annotation.title = "custom pin"
                annotation.subtitle = "vtc academy"
                self.mapView.addAnnotation(annotation)
                
                
                // request để tìm đường
                let directionsRequest = MKDirectionsRequest()
                
                let markSource = MKPlacemark(coordinate: CLLocationCoordinate2DMake(self.currentLocation.latitude, self.currentLocation.longitude), addressDictionary: nil)
                
                let markDestination = MKPlacemark(coordinate: CLLocationCoordinate2DMake(coordinates.latitude, coordinates.longitude), addressDictionary: nil)
                
                directionsRequest.source = MKMapItem(placemark: markSource)
                
                directionsRequest.destination = MKMapItem(placemark: markDestination)
                
                
                directionsRequest.transportType = MKDirectionsTransportType.Automobile
                
                let directions = MKDirections(request: directionsRequest)
                
                directions.calculateDirectionsWithCompletionHandler ({
                    (response: MKDirectionsResponse?, error: NSError?) in
                    self.myRoute = response!.routes[0]
                    
                    self.mapView.addOverlay((self.myRoute?.polyline)!)
                })
                
                
                self.drawRouteFromCurrentLocationToDistination(self.currentLocation, destination: coordinates)
            }
        })
    }
    
    //MARK:- nối giữa 2 điểm theo đường thằng
    func drawRouteFromCurrentLocationToDistination(currentLocation: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) -> Void {
        var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
        
        points.append(currentLocation)
        points.append(destination)
        
        let polyline = MKPolyline(coordinates: &points, count: points.count)
        self.mapView.addOverlay(polyline)
    }
    
    //MARK:- MapView delegate to draw route
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        
        if overlay is MKPolyline {
            polylineRenderer.strokeColor = UIColor.blueColor()
            polylineRenderer.lineWidth = 5
            
        }
        return polylineRenderer
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

