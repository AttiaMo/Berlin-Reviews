//
//  ReviewApi.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 8/31/18.
//  Copyright © 2018 Attia Mo. All rights reserved.
//

import Foundation
import Moya

// Review api details
enum ReviewApi{
    case getReviews(page :String , count : String)
}

extension ReviewApi : TargetType{
    
    var baseURL: URL{
        return URL(string:"https://www.getyourguide.com/")!
    }
    
    var path: String {
        switch self{
        case .getReviews:
            return "berlin-l17/tempelhof-2-hour-airport-history-tour-berlin-airlift-more-t23776/reviews.json"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getReviews :
            return .get
            
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getReviews(let page , let count):
            return .requestParameters(parameters: ["page":page,"count":count,"sortBy":"date_of_review","direction":"DESC"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json","Cache-Control": "no-cache"]
    }
    
}
