//
//  ApiError.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 8/31/18.
//  Copyright © 2018 Attia Mo. All rights reserved.
//

import Foundation

// custom class to handle custom Error
enum ApiError : LocalizedError{
	case error(message : String)
	case unKnown
	
	var failureReason: String? { return errorDescription }
	var errorDescription: String?{
		switch self {
		case .error(let message):
			return message
		default:
			return "UnKnown error"
		}
	}
}

enum AuthError: Error{
	case tokenExpired
}


