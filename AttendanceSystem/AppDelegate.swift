//
//  AppDelegate.swift
//  AttendanceSystem
//
//  Created by Kenil on 09/02/26.
//

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var appDelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GMSServices.provideAPIKey("AIzaSyD4Fl5fv1u4g-96GrYYGCJmqCtTx6fs_CI")
        
        setUpLogin()
        
        return true
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

}

