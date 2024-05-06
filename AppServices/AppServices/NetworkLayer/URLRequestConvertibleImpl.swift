//
//  URLRequestConvertibleImpl.swift
//  AppServices
//
//  Created by Mo'men Abd Elmageed on 06/05/2024.
//

import Foundation
import Alamofire


/// A struct for converting `AppURLRequestConvertible` instances into `URLRequest` instances.
struct URLRequestConvertibleImpl: URLRequestConvertible {
    
    /// The `AppURLRequestConvertible` instance to be converted.
    private let request: AppURLRequestConvertible
    
    
    /// Initializes a `URLRequestConvertibleImpl` with the specified `AppURLRequestConvertible`.
    ///
    /// - Parameter request: The `AppURLRequestConvertible` instance.
    init(request: AppURLRequestConvertible) {
        self.request = request
    }
    
    
    /// Converts the `AppURLRequestConvertible` instance into a `URLRequest`.
    ///
    /// - Returns: A `URLRequest` instance representing the converted request.
    /// - Throws: An error if the conversion process fails.
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: request.baseURL.appendingPathComponent(request.path))
        urlRequest.httpMethod = request.method.rawValue
        let encoding: URLEncoding = request.encoding.getEncoding()  as! URLEncoding
        urlRequest = try encoding.encode(urlRequest, with: request.parameters)
        
        if let headers = request.appHeader?.headers {
            for header in headers {
                urlRequest.addValue(header.value, forHTTPHeaderField: header.name)
            }
        }
        
        return urlRequest
    }
    
}
