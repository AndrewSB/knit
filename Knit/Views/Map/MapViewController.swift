//
//  MapViewController.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        if let _ = Location.sharedInstance.mostRecentLocation {
            updateLocation()
            let userRegion = MKCoordinateRegion(center: Location.sharedInstance.mostRecentLocation!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
            mapView.setRegion(userRegion, animated: true)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        LocalMessage.observe(.NewLocationRegistered, classFunction: "updateLocation", inClass: self)
        
        for user in NSBundle.json("allusers")!.json()!.map({ User(json: $0 as! [String: String])! }) {
            let annotation = AvatarAnnotation(user: user, at: CLLocation(latitude: user.currentLocation!.coordinate.latitude, longitude: user.currentLocation!.coordinate.longitude).coordinate)
            
            mapView.addAnnotation(annotation)
        }
        
        let centerCoord = CLLocationCoordinate2D(latitude: 37.769044, longitude: -122.489614)
        
        let rotationCamera = self.mapView.camera.copy() as! MKMapCamera
        rotationCamera.heading = 90
        
        self.mapView.setCamera(rotationCamera, animated: false)
        
        
        let adjustRegion = self.mapView.regionThatFits(MKCoordinateRegion(center: centerCoord, span: MKCoordinateSpan(latitudeDelta: 0.0001, longitudeDelta: 0.0001)))
    
        self.mapView.setRegion(adjustRegion, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        LocalMessage.resign(me: self)
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let a = annotation as? AvatarAnnotation {
            return AvatarAnnotationView(user: a.user)
        } else {
            return MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        }
        
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        
    }
    
    func updateLocation() {
        mapView.showsUserLocation = true
    }
    
}

extension MapViewController: UIPopoverPresentationControllerDelegate {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "popoverPopup" {
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}