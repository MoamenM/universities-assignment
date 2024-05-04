//
//  UniversitiesRouter.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 03/05/2024.
//

import Foundation

enum UniversitiesRouter: AppURLRequestConvertible {
    
    case getUniversities
    
    var path: String {
        switch self {
        case .getUniversities:
            return "search"
        }
    }
    
    var method: AppHTTPMethod {
        switch self {
        case .getUniversities:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getUniversities:
            return ["country": "United Arab Emirates"]
        }
    }
    
}