//
//  AppURLRequestConvertible.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 04/05/2024.
//

import Foundation
import Alamofire

/// Represents HTTP headers and parameter encoding for network requests.
public struct AppHTTPHeader {
    /// The array of HTTP headers.
    let headers: [AppHeader]
}


/// Represents an HTTP header with a name and value.
struct AppHeader {
    /// The name of the header.
    let name: String
    /// The value of the header.
    let value: String
}


/// A protocol for defining parameter encoding strategies.
public protocol AppParameterEncoding {
    /// The associated type for encoding strategy.
    associatedtype E
    /// Returns the encoding strategy.
    func getEncoding() -> E
}


/// A wrapper for URLEncoding as a parameter encoding strategy.
struct EncoderWrapper: AppParameterEncoding {
    /// The associated type for encoding is URLEncoding.
    public typealias E = URLEncoding
    /// Returns the URLEncoding encoding strategy.
    public func getEncoding() -> URLEncoding {
        return URLEncoding()
    }
}


/**
 Represents content types for HTTP requests and responses.
 
 - json: Represents the "application/json" content type.
 */
enum ContentType: String {
    case json = "application/json"
}


/**
 Represents keys for common HTTP header fields.
 
 - acceptType: Represents the "Accept" header field key.
 - contentType: Represents the "Content-Type" header field key.
 */
enum HTTPHeaderFieldKey: String {
    case acceptType = "Accept"
    case contentType = "Content-Type"
}


/**
 Represents HTTP methods for network requests with their string representations.
 
 - delete: Represents the DELETE HTTP method.
 - get: Represents the GET HTTP method.
 - post: Represents the POST HTTP method.
 - put: Represents the PUT HTTP method.
 */
public enum AppHTTPMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}


/**
 A protocol defining requirements for creating URLRequest objects for network requests within the application.
 
 Conforming types must provide implementations for properties such as baseURL, path, parameters, headers, method, and encoding.
 */
public protocol AppURLRequestConvertible {
    /// The base URL for the request.
    var baseURL: URL { get }
    /// The path component of the URL.
    var path: String { get }
    /// The parameters to be included in the request.
    var parameters: [String: Any] { get }
    /// The HTTP headers for the request.
    var appHeader: AppHTTPHeader? { get}
    /// The HTTP method for the request.
    var method: AppHTTPMethod { get }
    /// The parameter encoding for the request.
    var encoding: any AppParameterEncoding { get }
}

public extension AppURLRequestConvertible {
    
    /// The default base URL for requests.
    var baseURL: URL {
        return URL(string: NetworkConstants.baseUrl.rawValue)!
    }
    
    /// Constructs a URL by appending the path component to the base URL.
    func asURL() throws -> URL {
        return baseURL.appendingPathComponent(path)
    }
    
    /// The default headers for requests.
    var appHeader: AppHTTPHeader? {
        var headers: [AppHeader] = []
        headers.append(AppHeader(name: HTTPHeaderFieldKey.acceptType.rawValue, value: ContentType.json.rawValue))
        headers.append(AppHeader(name: HTTPHeaderFieldKey.contentType.rawValue, value: ContentType.json.rawValue))
        return AppHTTPHeader(headers: headers)
    }
    
    /// The default parameter encoding for requests.
    var encoding: any AppParameterEncoding {
        return EncoderWrapper()
    }
}

