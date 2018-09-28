//
//  MoyaRequest.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 8/31/18.
//  Copyright © 2018 Attia Mo. All rights reserved.
//

import Foundation
import Moya
import RxSwift

// general class to handle basic API request operation
class MoyaApi<Target: TargetType> {
	
	func request(provider : MoyaProvider<Target>, token : Target)-> Observable<Data>{
		
		UIApplication.shared.isNetworkActivityIndicatorVisible = true

		let task = provider.rx.request(token).asObservable()
		
		return task.flatMap { (response) ->  Observable<Data> in
			UIApplication.shared.isNetworkActivityIndicatorVisible = false
				return Observable.just(response.data)
		}
	}
}

