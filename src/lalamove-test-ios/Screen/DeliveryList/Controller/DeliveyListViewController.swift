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

	struct Constants {

		static let title: String = "Things to Deliver"
	}

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
		self.myView?.tableView.register(DeliveryListTableViewCell.self, forCellReuseIdentifier: DeliveryListTableViewCell.reuseIdentifier())
	}

    override func viewDidLoad() {

        super.viewDidLoad()

		self.title = Constants.title

		self.fetchData(ignoreCache: false)
		self.fetchData(ignoreCache: true)
	}

	// MARK: - Helpers

	func fetchData(ignoreCache isIgnoreCache: Bool) {

		_ = NetworkManager.sharedInstance().getDeliveryList(ignoreCache: isIgnoreCache,
		                                                    success: { (response) in

																self.updateDataSource(withResponse: response?.response, fromCache: !isIgnoreCache)
		},
		                                                    failure: { (error, response) in

																self.updateDataSource(withResponse: nil, fromCache: !isIgnoreCache)
		})
	}

	func updateDataSource(withResponse response: [DeliveryItem]?, fromCache isFromCache: Bool) {

		if (response != nil) {

			if (isFromCache == true && self.dataSource == nil) {

				self.dataSource = response

			} else if (isFromCache == false) {

				self.dataSource = response
			}
		}

		self.myView?.tableView.reloadData()
	}

	// MARK: - <UITableViewDataSource>

	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell: DeliveryListTableViewCell! = tableView.dequeueReusableCell(withIdentifier: DeliveryListTableViewCell.reuseIdentifier()) as! DeliveryListTableViewCell

		cell.model = self.dataSource?[indexPath.row]

		return cell!
	}

	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return self.dataSource?.count ?? 0
	}

	// MARK: - <UITableViewDelegate>

	public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return DeliveryListTableViewCell.height()
	}

	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		let model: DeliveryItem! = self.dataSource?[indexPath.row]

		let vc: DeliveryDetailViewController = DeliveryDetailViewController(model: model)

		self.navigationController?.pushViewController(vc, animated: true)
	}
}
