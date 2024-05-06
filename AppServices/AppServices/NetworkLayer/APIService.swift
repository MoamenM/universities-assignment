//
//  APIService.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 03/05/2024.
//

import Foundation
import Alamofire

/**
 Handles network requests and responses, providing methods to make requests and map errors.
 
 - SeeAlso: `Result<T>`, `APIError`
 */
public class APIService: APIServiceProtocol {
    
    public init() { }
    
    /**
     Makes a network request using a URLRequestConvertible object and decodes the response to the specified Codable type.
     
     - Parameters:
     - request: The URLRequestConvertible object representing the request to be made.
     - type: The Codable type to which the response should be decoded.
     - completionHandler: A closure to be executed when the request finishes, containing the result of the request.
     - result: A Result object containing either the decoded response on success or an error on failure.
     */
    public func request<T: Codable>(_ request: AppURLRequestConvertible, decodeToType type: T.Type, completionHandler: @escaping (AppResult<T>) -> ()) {
        
        AF.request(URLRequestConvertibleImpl(request: request)).responseData { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(decoded))
                } catch {
                    completionHandler(.failure(.other))
                }
            case .failure(let error):
                let appError = self.mapAFErrorToAPIError(error)
                completionHandler(.failure(appError))
            }
        }
    }
    
    
    /**
     Maps an Alamofire error to a custom application-specific error.
     
     - Parameters:
     - afError: The Alamofire error to be mapped to the application-specific error.
     
     - Returns: An instance of the custom APIError enum representing the mapped error.
     */
    private func mapAFErrorToAPIError(_ afError: AFError) -> APIError {
        switch afError {
        case .sessionTaskFailed(let error as URLError) where error.code == .notConnectedToInternet:
            return .networkUnavailable
        case .responseValidationFailed(let reason):
            if case .unacceptableStatusCode(let code) = reason, code >= 500 && code < 600  {
                return .serverError
            } else {
                return .other
            }
            
        default:
            return .other
        }
    }
}
