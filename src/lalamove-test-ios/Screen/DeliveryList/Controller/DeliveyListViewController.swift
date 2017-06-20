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

	// MARK: - View lifecycle

	override func loadView() {

		self.view = UIView()
		self.view.backgroundColor = UIColor.blue
	}

    override func viewDidLoad() {

        super.viewDidLoad()

		SFNetworkManager.sharedInstance().request(withURL: "http://localhost:8080/deliveries",
		                                          method: SFRequestMethodGET,
		                                          parameters: nil,
		                                          ignoreCache: false,
		                                          cachePeriodInSecs: 6000,
		                                          success: nil,
		                                          failure: nil)
    }
}
