//
//  AppCoordinator.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 06/04/22.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = MainViewController.instantiate()
        let navigationController = createNavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func createNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        
        nav.navigationBar.backgroundColor = .systemBlue
        nav.navigationBar.barTintColor = .systemBlue
        nav.navigationBar.tintColor = .systemBlue
        nav.navigationBar.prefersLargeTitles = true
        
        return nav
    }
}
