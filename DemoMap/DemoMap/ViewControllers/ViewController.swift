//
//  ViewController.swift
//  DemoMap
//
//  Created by Điệp Nguyễn on 6/10/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapview.mapType = .Standard
        self.mapview.delegate = self
        
        self.zoomToRegion()
        
        /*add one annotation*/
//        let annotation = CustomAnotation(latitude: 13.03297, longtitude: 80.26518)
//        annotation.title = "custom pin"
//        annotation.subtitle = "vtc academy"
//        self.mapview.addAnnotation(annotation)
        

        /*add multi annotation*/
        let annotations = getMapAnnotations()
        
        self.mapview.addAnnotations(annotations)
        
        
        
//         Connect all the mappoints using Poly line. 
        
        var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
        
        for annotation in annotations {
            points.append(annotation.coordinate)
        }
        
        
        let polyline = MKPolyline(coordinates: &points, count: points.count)
        
        mapview.addOverlay(polyline)
    }
    
    //MARK:- zoom to region
    func zoomToRegion() -> Void {
        let location = CLLocationCoordinate2D(latitude: 13.03297, longitude: 80.26518)
        
        let region = MKCoordinateRegionMakeWithDistance(location, 5000.0, 7000.0)
        self.mapview.setRegion(region, animated: true)
    }
    
    //MARK:- get list annotation
    func getMapAnnotations() -> [CustomAnotation] {
        var annotations:Array = [CustomAnotation]()
        
        //load plist file
        var stations: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("anotation", ofType: "plist") {
            
            stations = NSArray(contentsOfFile: path)
        }
        
        if let items = stations {
            for item in items {
                let lat = item.valueForKey("lat") as! Double
                let long = item.valueForKey("long")as! Double
                let subtitle = item.valueForKey("subtitle") as! String
                
                
                let annotation = CustomAnotation(latitude: lat, longtitude: long)
                annotation.title = item.valueForKey("title") as? String
                annotation.subtitle = subtitle
                
                annotations.append(annotation)
            }
        }
        
        return annotations
    }
    
//    //MARK:- MapView delegate to draw route
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        
        if overlay is MKPolyline {
            polylineRenderer.strokeColor = UIColor.blueColor()
            polylineRenderer.lineWidth = 5
            
        }
        return polylineRenderer
    }
//
//    // custom view for annotation view
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is CustomAnotation) {
            return nil
        }
        
        let reuseId = "reuseidentifer"
        
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        
        
        if anView == nil {
            anView = CustomAnnotionView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.canShowCallout = false
            
        }
        else {
            anView!.annotation = annotation
        }
        
        //Set annotation-specific properties **AFTER**
        //the view is dequeued or created...
        
        anView!.image = UIImage(named:"map_marker")
        
        return anView
    
    }
    
    
    func mapViewDidFinishLoadingMap(mapView: MKMapView) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

