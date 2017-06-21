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
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	// MARK: - Constants

	struct Constants {

		static let databaseStoreName = "lalamove-test"
		static let googleAPIKey = "AIzaSyAQv15OlqBSBAaXgrH2ZEvmrcI7fgYLb4E"
	}

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

		self.setupGoogleService()

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

		StakkKit.setupStakkKit(withLoggingLevel: SFLogLevel.all, databaseStoreName: Constants.databaseStoreName)
	}

	func setupGoogleService() {

		GMSServices.provideAPIKey(Constants.googleAPIKey)
	}

	func setupLandingScreen() {

		self.window?.rootViewController = self.navigationController

		self.navigationController.viewControllers = [ DeliveyListViewController() ]
	}
}

