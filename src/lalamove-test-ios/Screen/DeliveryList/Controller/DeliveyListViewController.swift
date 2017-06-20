//
//  DeliveyListViewController.swift
//  lalamove-test-ios
//
//  Created by Derek Cheung on 20/6/2017.
//  Copyright © 2017 Derek Cheung. All rights reserved.
//

import UIKit

// Frameworks
import StakkKit

class DeliveyListViewController: UIViewController {

	// MARK: - Constants

	let kTitle = "Things to Deliver"

	// MARK: - Variables

	var myView: DeliveryListView? {

		return self.view as? DeliveryListView
	}

	// MARK: - View lifecycle

	override func loadView() {

		self.view = DeliveryListView()
	}

    override func viewDidLoad() {

        super.viewDidLoad()

		self.title = kTitle

		_ = NetworkManager.sharedInstance().getDeliveryList(
			success: { (response) in

		},
			failure: nil)
	}
}
