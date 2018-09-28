//
//  ItemReviews.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 9/28/18.
//  Copyright © 2018 Attia Mo. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   let reviews = try? newJSONDecoder().decode(Reviews.self, from: jsonData)

// To parse the JSON, add this file to your project and do:
//
//   let reviews = try? newJSONDecoder().decode(Reviews.self, from: jsonData)

import Foundation

class Reviews: Codable {
    let status: Bool?
    let totalReviewsComments: Int?
    let data: [ReviewItem]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalReviewsComments = "total_reviews_comments"
        case data
    }
    
    init(status: Bool?, totalReviewsComments: Int?, data: [ReviewItem]?) {
        self.status = status
        self.totalReviewsComments = totalReviewsComments
        self.data = data
    }
}

class ReviewItem: Codable {
    let reviewID: Int?
    let rating, title, message, author: String?
    let foreignLanguage: Bool?
    let date: String?
    let dateUnformatted: DateUnformatted?
    let languageCode, travelerType, reviewerName, reviewerCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case reviewID = "review_id"
        case rating, title, message, author, foreignLanguage, date
        case dateUnformatted = "date_unformatted"
        case languageCode
        case travelerType = "traveler_type"
        case reviewerName, reviewerCountry
    }
    
    init(reviewID: Int?, rating: String?, title: String?, message: String?, author: String?, foreignLanguage: Bool?, date: String?, dateUnformatted: DateUnformatted?, languageCode: String?, travelerType: String?, reviewerName: String?, reviewerCountry: String?) {
        self.reviewID = reviewID
        self.rating = rating
        self.title = title
        self.message = message
        self.author = author
        self.foreignLanguage = foreignLanguage
        self.date = date
        self.dateUnformatted = dateUnformatted
        self.languageCode = languageCode
        self.travelerType = travelerType
        self.reviewerName = reviewerName
        self.reviewerCountry = reviewerCountry
    }
}

class DateUnformatted: Codable {
    
    init() {
    }
}
