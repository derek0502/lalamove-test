//
//  AppDelegate.swift
//  lalamove-test-ios
//
//  Created by Derek Cheung on 19/6/2017.
//  Copyright © 2017 Derek Cheung. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	// MARK: - Variables

	var window: UIWindow?

	private var _navigationController: UINavigationController?
	var navigationController: UINavigationController! {

		get {

			if (_navigationController == nil) {

				_navigationController = UINavigationController()
			}

			return _navigationController
		}
	}

	// MARK: - <UIApplicationDelegate>

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		self.setupLandingScreen()

		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
	}

	func applicationWillTerminate(_ application: UIApplication) {
	}

	// MARK: - Helpers

	func setupLandingScreen() {

		self.window = UIWindow.init(frame: UIScreen.main.bounds)
		self.window?.makeKeyAndVisible()

		self.window?.rootViewController = self.navigationController

		self.navigationController.viewControllers = [ ViewController() ]
	}
}

