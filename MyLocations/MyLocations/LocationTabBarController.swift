//
//  LocationTabBarController.swift
//  MyLocations
//
//  Created by J. John on 3/30/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit
import MapKit

class LocationData{
    var lat = 0.0
    var long = 0.0
}

class LocationTabBarController: UITabBarController{
    
    var currentLocation = LocationData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}