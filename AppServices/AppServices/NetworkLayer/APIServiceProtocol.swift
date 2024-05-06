//
//  APIServiceProtocol.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 04/05/2024.
//

import Foundation
import Alamofire

/**
 A protocol defining requirements for making network requests and decoding responses.
 
 Conforming types must provide an implementation for the `request` method, which sends a URLRequestConvertible object, decodes the response to the specified Codable type, and executes a completion handler with the result.
 */
public protocol APIServiceProtocol {
    
    /**
     Sends a network request, decodes the response to the specified Codable type, and executes a completion handler with the result.
     
     - Parameters:
        - request: The URLRequestConvertible object representing the request to be made.
        - type: The Codable type to which the response should be decoded.
        - completionHandler: A closure to be executed when the request finishes, containing the result of the request.
            - result: A Result object containing either the decoded response on success or an error on failure.
     */
    func request<T: Codable>(_ request: AppURLRequestConvertible, decodeToType type: T.Type, completionHandler: @escaping (AppResult<T>) -> ())
}
