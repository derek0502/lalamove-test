//
//  DeliveryList.swift
//  lalamove-test-ios
//
//  Created by Derek Cheung on 20/6/2017.
//  Copyright © 2017 Derek Cheung. All rights reserved.
//

import StakkKit

class DeliveryList: SFBaseModel {

	// MARK: - Variables

	var response: [Delivery]?

	// MARK: - Override

	override open class func `class`(forCollectionProperty propertyName: String!) -> Swift.AnyClass! {

		switch propertyName {

		case #keyPath(DeliveryList.response):
			return Delivery.self

		default:
			return nil
		}
	}
}
