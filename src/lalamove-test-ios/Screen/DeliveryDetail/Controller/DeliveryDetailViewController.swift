//
//  DeliveryDetailViewController.swift
//  lalamove-test-ios
//
//  Created by Derek Cheung on 21/6/2017.
//  Copyright © 2017 Derek Cheung. All rights reserved.
//

import UIKit

class DeliveryDetailViewController: UIViewController {

	// MARK: - Constants

	struct Constants {

		static let title: String = "Deliver Details"
	}

	// MARK: - Variables

	var model: DeliveryItem?

	// MARK: - Initialization

	required init?(coder aDecoder: NSCoder) {

		super.init(coder: aDecoder)
	}

	init(model: DeliveryItem) {

		self.model = model
		super.init(nibName: nil, bundle: nil)
	}

	// MARK: - View lifecycle

	override func loadView() {

		self.view = DeliveryDetailView(model: self.model!)
	}

    override func viewDidLoad() {

        super.viewDidLoad()

		self.title = Constants.title
    }
}
