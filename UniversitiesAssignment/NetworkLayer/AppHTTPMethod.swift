//
//  AppHTTPMethod.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 04/05/2024.
//

import Foundation

/**
 Represents HTTP methods for network requests with their string representations.
 
 - delete: Represents the DELETE HTTP method.
 - get: Represents the GET HTTP method.
 - post: Represents the POST HTTP method.
 - put: Represents the PUT HTTP method.
 */
enum AppHTTPMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}
