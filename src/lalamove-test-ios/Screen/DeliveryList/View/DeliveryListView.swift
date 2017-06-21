//
//  DeliveryListView.swift
//  lalamove-test-ios
//
//  Created by Derek Cheung on 20/6/2017.
//  Copyright © 2017 Derek Cheung. All rights reserved.
//

import StakkKit

class DeliveryListView: SFBaseView {

	// MARK: - Variables

	private(set) public var tableView: UITableView!;

	// MARK: - Setup

	override func setup () {

		super.setup()

		self.backgroundColor = UIColor.white

		self.setupTableView()
	}

	func setupTableView () {

		self.tableView = UITableView.newAutoLayout()

		self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
	}

	// MARK: - Setup Layer

	override func setupLayer() {

		super.setupLayer()

		self.addSubview(self.tableView)
	}

	// MARK: - Setup Constraints

	override func setupConstraints() {

		super.setupConstraints()

		self.setupTableViewConstraints()
	}

	func setupTableViewConstraints() {

		self.tableView.autoPinEdgesToSuperviewEdges()
	}
}
