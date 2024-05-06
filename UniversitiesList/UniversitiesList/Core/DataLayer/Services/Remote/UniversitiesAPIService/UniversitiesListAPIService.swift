//
//  UniversitiesListAPIService.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 03/05/2024.
//

import Foundation
import AppServices

/// Enum representing the endpoints for the universities list module.
enum UniversitiesListAPIService: AppURLRequestConvertible {
    
    /// Endpoint for fetching universities.
    case getUniversities
    
    /// The path component of the URL for each endpoint.
    var path: String {
        switch self {
        case .getUniversities:
            return "search"
        }
    }
    
    /// The HTTP method used for each endpoint.
    var method: AppHTTPMethod {
        switch self {
        case .getUniversities:
            return .get
        }
    }
    
    /// The parameters to be included in the request for each endpoint.
    var parameters: [String : Any] {
        switch self {
        case .getUniversities:
            return ["country": "United Arab Emirates"]
        }
    }
    
}

