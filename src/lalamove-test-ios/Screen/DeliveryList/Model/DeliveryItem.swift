//
//  DeliveryItem.swift
//  lalamove-test-ios
//
//  Created by Derek Cheung on 20/6/2017.
//  Copyright © 2017 Derek Cheung. All rights reserved.
//

import StakkKit

class DeliveryItem: SFBaseModel {

	// MARK: - Variables

	var deliveryDescription: String?
	var imageUrl: URL?
	var location: DeliveryLocation?

	// MARK: - Override

	override open class func keyMapper() -> JSONKeyMapper! {

		return JSONKeyMapper.init(modelToJSONDictionary: ["deliveryDescription" : "description"])
	}

	override open class func `class`(forCollectionProperty propertyName: String!) -> Swift.AnyClass! {

		switch propertyName {

		case #keyPath(DeliveryItem.location):
			return DeliveryLocation.self

		default:
			return nil
		}
	}
}
