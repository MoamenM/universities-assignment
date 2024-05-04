//
//  AppURLRequestConvertible.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 04/05/2024.
//

import Foundation
import Alamofire

/**
 A protocol defining requirements for creating URLRequest objects for network requests within the application.
 
 Conforming types must provide implementations for properties such as baseURL, path, parameters, headers, method, and encoding.
 */
protocol AppURLRequestConvertible: URLRequestConvertible {
    /// The base URL for the request.
    var baseURL: URL { get }
    /// The path component of the URL.
    var path: String { get }
    /// The parameters to be included in the request.
    var parameters: Parameters? { get }
    /// The HTTP headers for the request.
    var headers: HTTPHeaders? { get}
    /// The HTTP method for the request.
    var method: AppHTTPMethod { get }
    /// The parameter encoding for the request.
    var encoding: ParameterEncoding { get }
}

extension AppURLRequestConvertible {
    
    /// The default base URL for requests.
    var baseURL: URL  {
        return URL(string: Constants.baseURL)!
    }
    
    /// Constructs a URL by appending the path component to the base URL.
    func asURL() throws -> URL {
        return baseURL.appendingPathComponent(path)
    }
    
    /// The default headers for requests.
    var headers: HTTPHeaders? {
        var headers = HTTPHeaders.init()
        headers[HTTPHeaderFieldKey.acceptType.rawValue] = ContentType.json.rawValue
        headers[HTTPHeaderFieldKey.contentType.rawValue] = ContentType.json.rawValue
        return headers
    }
    
    /// The default parameter encoding for requests.
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    /// Constructs a URLRequest using the properties conforming to the protocol.
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest = try encoding.encode(urlRequest, with: parameters)

        if let headers = headers {
            for header in headers {
                urlRequest.addValue(header.value, forHTTPHeaderField: header.name)
            }
        }

        return urlRequest
    }

}
