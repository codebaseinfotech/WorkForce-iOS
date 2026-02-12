//
//  AppDelegate.swift
//  AttendanceSystem
//
//  Created by Kenil on 09/02/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setUpHome()
        
        return true
    }

    // MARK: - Root Controllers
    func setUpLogin() {
        let nav = UINavigationController(rootViewController: OnboardVC())
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

