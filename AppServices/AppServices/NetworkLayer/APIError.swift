//
//  APIError.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 04/05/2024.
//

import Foundation

/**
 Represents custom error types that may occur within the application.
 
 - networkUnavailable: Indicates that the network is unavailable.
 - serverError: Indicates an error response from the server.
 - other: Represents other unspecified errors.
 */
public enum APIError: Error {
    case networkUnavailable
    case serverError
    case other
}
