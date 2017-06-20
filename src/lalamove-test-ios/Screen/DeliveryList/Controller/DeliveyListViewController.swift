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

		SFNetworkManager.sharedInstance().request(withURL: "http://localhost:8080/deliveries",
		                                          method: SFRequestMethodGET,
		                                          parameters: nil,
		                                          ignoreCache: false,
		                                          cachePeriodInSecs: 6000,
		                                          success: { (responseDict) in

													let response:DeliveryList? = try? DeliveryList.init(dictionary: responseDict)
													print(response?.response?.first);
		},
		                                          failure: nil)
	}
}
