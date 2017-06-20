//
//  AppDelegate.swift
//  lalamove-test-ios
//
//  Created by Derek Cheung on 19/6/2017.
//  Copyright © 2017 Derek Cheung. All rights reserved.
//

import UIKit

// Frameworks
import StakkKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	let kDatabaseStoreName = "lalamove-test"

	// MARK: - Variables

	var window: UIWindow? = {

		var tempWindow = UIWindow.init(frame: UIScreen.main.bounds)
		tempWindow .makeKeyAndVisible()

		return tempWindow
	} ()

	var navigationController: UINavigationController! = {

		var tempNVC = UINavigationController()

		return tempNVC
	} ()

	// MARK: - <UIApplicationDelegate>

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		self.setupStakkKit()

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

	func setupStakkKit() {

		StakkKit.setupStakkKit(withLoggingLevel: SFLogLevel.all, databaseStoreName: kDatabaseStoreName)
	}

	func setupLandingScreen() {

		self.window?.rootViewController = self.navigationController

		self.navigationController.viewControllers = [ DeliveyListViewController() ]
	}
}

