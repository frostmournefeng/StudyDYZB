//
//  AppDelegate.swift
//  StudyDYZB
//
//  Created by yyk on 2018/12/14.
//  Copyright © 2018 yyk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UITabBar.appearance().tintColor = UIColor.orange;
        
        return true
    }
}

