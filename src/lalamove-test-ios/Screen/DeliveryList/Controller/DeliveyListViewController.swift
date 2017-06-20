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

class DeliveyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	// MARK: - Constants

	let kTitle = "Things to Deliver"

	// MARK: - Variables

	var myView: DeliveryListView? {

		return self.view as? DeliveryListView
	}

	var dataSource: [DeliveryItem]?

	// MARK: - View lifecycle

	override func loadView() {

		self.view = DeliveryListView()

		self.myView?.tableView.delegate = self
		self.myView?.tableView.dataSource = self
		self.myView?.tableView.register(SFBaseTableViewCell.self, forCellReuseIdentifier: SFBaseTableViewCell.reuseIdentifier())
	}

    override func viewDidLoad() {

        super.viewDidLoad()

		self.title = kTitle

		_ = NetworkManager.sharedInstance().getDeliveryList(ignoreCache: true,
		                                                    success: { (response) in

																self.dataSource = response?.response
																self.myView?.tableView.reloadData()

		},
		                                                    failure: nil)
	}

	// MARK: - <UITableViewDataSource>

	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell:SFBaseTableViewCell! = tableView.dequeueReusableCell(withIdentifier: SFBaseTableViewCell.reuseIdentifier()) as! SFBaseTableViewCell
		cell.bottomSeparator.isHidden = false

		return cell!
	}

	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return self.dataSource?.count ?? 0
	}

	// MARK: - <UITableViewDelegate>

	public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 50
	}
}
