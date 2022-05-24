//
//  AppDelegate.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 28/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        let applicationCoordinator = AppCoordinator(window: window)
        
        self.window = window
        self.appCoordinator = applicationCoordinator
        
        appCoordinator?.start()
        
        return true
    }

}

