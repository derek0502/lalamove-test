//
//  NetworkManager.swift
//  lalamove-test-ios
//
//  Created by Derek Cheung on 20/6/2017.
//  Copyright © 2017 Derek Cheung. All rights reserved.
//

import StakkKit

typealias GetDeliveryListSuccessBlock = (DeliveryList?) -> Swift.Void

class NetworkManager: SFNetworkManager {

	// MARK: - Constants

	let kAPIDomain = "http://localhost:8080/"
	let kAPIGetDeliveryList = "deliveries"

	// MARK: - Public

	public func getDeliveryList (success: GetDeliveryListSuccessBlock?, failure: SFRequestFailureBlock?) -> URLSessionDataTask? {

		return self.request(withURL: kAPIDomain + kAPIGetDeliveryList,
		                    method: SFRequestMethodGET,
		                    parameters: nil,
		                    ignoreCache: false,
		                    cachePeriodInSecs: 6000,
		                    success: { (responseDict) in

								if (success != nil) {

									let response:DeliveryList? = try? DeliveryList.init(dictionary: responseDict)
									success?(response)
								}
		},
		                    failure: failure)
	}

}
