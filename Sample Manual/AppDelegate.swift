//
//  AppDelegate.swift
//  Sample Manual
//
//  Created by Jan Sebastian on 12/10/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        
        let vc = UINavigationController(rootViewController: HomeViewController())
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        return true
    }

}

