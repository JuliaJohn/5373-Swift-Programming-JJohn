//
//  FirstViewController.swift
//  MyLocations
//
//  Created by Terry Griffin on 3/24/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    var location: CLLocation?
    
    

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var getButton: UIButton!
    
    @IBAction func getLocation() {
        
        let authStatus: CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        
        if authStatus == .Denied || authStatus == .Restricted {
            showLocationServicesDeniedAlert()
            return
        }
        
        if authStatus == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    func showLocationServicesDeniedAlert() {
        let alert = UIAlertController(title: "Location Services Disabled",
            message: "Please enable location services for this app in Settings.",
            preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default,handler: nil)
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager!,didFailWithError error: NSError!) {
            println("didFailWithError \(error)")
    }
    
    func locationManager(manager: CLLocationManager!,didUpdateLocations locations: [AnyObject]!) {
            let newLocation = locations.last as CLLocation
            println("didUpdateLocations \(newLocation)")
            
            location = newLocation
            
            updateLabels()
    }
    
    func updateLabels(){
        var loc = (self.tabBarController as LocationTabBarController).currentLocation
        
        if let location = location{
            loc.lat = location.coordinate.latitude
            loc.long = location.coordinate.longitude
            latitudeLabel.text = String(format: "%.8f", loc.lat)
            longitudeLabel.text = String(format: "%.8f", loc.long)
            
        }
        
    }
    
    
    
}

