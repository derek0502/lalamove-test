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

	struct Constants {

		static let APIDomain = "http://localhost:8080/"
		static let APIGetDeliveryList = "deliveries"
	}

	// MARK: - Public

	public func getDeliveryList (ignoreCache: Bool, success: GetDeliveryListSuccessBlock?, failure: SFRequestFailureBlock?) -> URLSessionDataTask? {

		return self.request(withURL: Constants.APIDomain + Constants.APIGetDeliveryList,
		                    method: SFRequestMethodGET,
		                    parameters: nil,
		                    ignoreCache: ignoreCache,
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
