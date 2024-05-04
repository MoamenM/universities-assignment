//
//  Result.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 04/05/2024.
//

import Foundation

/**
 Represents the result of an operation, either successful or failed.
 
 - success: Indicates a successful operation with associated data of type T.
 - failure: Indicates a failed operation with an associated error of type APIError.
 */
enum Result<T> {
    case success(T)
    case failure(APIError)
}
