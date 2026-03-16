//
//  AppDelegate.swift
//  AttendanceSystem
//
//  Created by Kenil on 09/02/26.
//

import UIKit
import GoogleMaps
import CoreLocation
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    
    static var appDelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }

    var latitude: Double?
    var longitude: Double?
    let locationManager = CLLocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Keyboard
        IQKeyboardManager.shared.enable = true
        
        GMSServices.provideAPIKey("AIzaSyD4Fl5fv1u4g-96GrYYGCJmqCtTx6fs_CI")
        
        WFUtilites.getIsCurrntUserLogin() ? self.setUpHome() : self.setUpLogin()
        
        setupLocation()
        
        return true
    }
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    // MARK: - Root Controllers
    func setUpOnboarding() {
        let nav = UINavigationController(rootViewController: OnboardVC())
        nav.navigationBar.isHidden = true
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    func setUpLogin() {
        let nav = UINavigationController(rootViewController: EmailLoginVC())
        nav.navigationBar.isHidden = true
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    func setUpHome() {
        let nav = UINavigationController(rootViewController: HomeVC())
        nav.navigationBar.isHidden = true
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
        
//        print("Current Latitude:", latitude ?? 0)
//        print("Current Longitude:", longitude ?? 0)
    }

}

