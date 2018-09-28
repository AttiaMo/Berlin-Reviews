//
//  ReviewsManager.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 8/31/18.
//  Copyright © 2018 Attia Mo. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol ReviewsRepository {
    func getReviews(page: Int, count:Int) -> Observable<[ReviewItem]?>
}

// Handle getting Reviews from API
class ReviewsManager {
    
    let apiRepository: ReviewsRepository = ApiReviewRepository()
    
    func getReviews(page: Int,count:Int) -> Observable<[ReviewItem]?> {
        let observer =  apiRepository.getReviews(page: page,count: count).do(onNext: { (reviews) in
        })
        return observer
    }
}


