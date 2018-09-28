//
//  ApiReviewRepository.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 9/1/18.
//  Copyright © 2018 Attia Mo. All rights reserved.
//

import Foundation
import RxSwift
import Moya

// Handle get Reviews from api
class ApiReviewRepository: ReviewsRepository {
    
	let provider = MoyaProvider<ReviewApi>()
    func getReviews(page: Int,count:Int) -> Observable<[ReviewItem]?>{
		return MoyaApi<ReviewApi>().request(provider: provider, token: .getReviews(page: String(page), count: String(count))).flatMap { (data) -> Observable<[ReviewItem]?> in
         
            do {
                let decoder = JSONDecoder()
                let reviews = try decoder.decode(Reviews.self, from: data)
                
                return Observable.just(reviews.data)
                
            } catch let err {
                return Observable.error(ApiError.error(message: err.localizedDescription))
            }
		}
	}
}
