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
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        LocationManager.shared.checkAuthorizationStatus()
        
        // Background -> Foreground에 들어왔을때 현재 지역으로 업데이트
        NotificationCenter.default.post(name: NSNotification.Name.init(App.Constant.updateRegion.rawValue), object: nil, userInfo: nil)
    }
    
    private func setupKeyWindow() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainVC = MainViewController(fineDustService: FineDustService(), placeMark: PlaceMark()) // Discuss
        window?.rootViewController = UINavigationController(rootViewController: mainVC)
        window?.makeKeyAndVisible()
    }

}

