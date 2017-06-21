//
//  DeliveryDetailView.swift
//  lalamove-test-ios
//
//  Created by Derek Cheung on 21/6/2017.
//  Copyright © 2017 Derek Cheung. All rights reserved.
//

import StakkKit
import GoogleMaps

class DeliveryDetailView: SFBaseView {

	// MARK: - Constants

	struct Constants {

		static let mapViewZoomLevel: Float = 14.0
	}

	// MARK: - Variables

	var model: DeliveryItem!
	var mapView: GMSMapView!
	var deliveryDetailView: UIView!

	// MARK: - Initialization

	required init?(coder aDecoder: NSCoder) {

		super.init(coder: aDecoder)
	}

	init(model: DeliveryItem) {

		super.init(frame: CGRect.zero)

		self.model = model
		self.setupAll()
	}

	// MARK: - Setup

	override func setup() {

		super.setup()

		self.backgroundColor = UIColor.white

		self.setupMapView()
		self.setupDeliveryDetailView()
	}

	func setupMapView() {

		let camera = GMSCameraPosition.camera(withLatitude: Double(self.model.location?.lat ?? "") ?? 0.0,
		                                      longitude: Double(self.model.location?.lng ?? "") ?? 0.0,
		                                      zoom: Constants.mapViewZoomLevel)

		self.mapView = GMSMapView.map(withFrame: .zero, camera: camera)

		let marker = GMSMarker()
		marker.position = camera.target
		marker.snippet = self.model.location?.address
		marker.appearAnimation = GMSMarkerAnimation.none
		marker.map = mapView
	}

	func setupDeliveryDetailView() {

		let cell:DeliveryListTableViewCell = DeliveryListTableViewCell()
		cell.model = self.model

		self.deliveryDetailView = cell.contentView
	}

	// MARK: - Setup Layer

	override func setupLayer() {

		super.setupLayer()

		self.addSubview(self.mapView)
		self.addSubview(self.deliveryDetailView)
	}

	// MARK: - Setup Constraints

	override func setupConstraints() {

		super.setupConstraints()

		self.setupMapViewConstraints()
		self.setupDeliveryDetailViewConstraints()
	}

	func setupMapViewConstraints() {

		self.mapView.translatesAutoresizingMaskIntoConstraints = false

		self.mapView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
	}

	func setupDeliveryDetailViewConstraints() {

		self.deliveryDetailView.translatesAutoresizingMaskIntoConstraints = false

		self.deliveryDetailView.autoPinEdge(.top, to: .bottom, of: self.mapView)
		self.deliveryDetailView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
		self.deliveryDetailView.autoSetDimension(.height, toSize: DeliveryListTableViewCell.height())
	}
}
