//
//  AppDelegate.swift
//  FineDust_Copy
//
//  Created by 승진김 on 19/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupKeyWindow()
        
        return true
    }
    
    private func setupKeyWindow() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainVC = MainViewController(fineDustService: FineDustService()) // Discuss
        window?.rootViewController = UINavigationController(rootViewController: mainVC)
        window?.makeKeyAndVisible()
    }

}

