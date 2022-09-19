//
//  AppDelegate.swift
//  News
//
//  Created by TranKhanh on 8/22/22.
//

import UIKit
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let appearance = UINavigationBar.appearance()
        appearance.backgroundColor = UIColor(red: 0, green: 142/255, blue: 125/255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        let newsVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        let navigation = UINavigationController(rootViewController: newsVC!)
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()

        IQKeyboardManager.shared.enable = true

        return true
    }
}

