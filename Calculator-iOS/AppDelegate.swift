//
//  AppDelegate.swift
//  Calculator-iOS
//
//  Created by Daniel Escandell González on 19/5/22.
//  Copyright © 2022 Daniel Escandell González. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Setup
        setupView()
        
        return true
    }

    // MARK: - Private Methods
    
    private func setupView() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
    }
    
}

