//
//  UniversitiesListWorker.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import Foundation
import AppServices

/// Handles network and local data operations related to universities list.
class UniversitiesListWorker: UniversitiesListWorkerProtocol {
    
    /// The network layer for making API requests.
    private let networkLayer: APIServiceProtocol
    
    
    /// Initializes a new `UniversitiesListWorker` with the specified network layer.
    ///
    /// - Parameter networkLayer: The network layer conforming to `APIServiceProtocol`.
    init(networkLayer: APIServiceProtocol) {
        self.networkLayer = networkLayer
    }
    
    
    /// Fetches universities data from the remote API.
    ///
    /// - Parameter completionHandler: A closure to be executed when the request finishes, containing the result of the request.
    func fetchUniversities(completionHandler: @escaping (AppResult<[University]>) -> ()) {
        networkLayer.request(UniversitiesListAPIService.getUniversities, decodeToType: [University].self, completionHandler: completionHandler)
    }
    
    /// Saves universities data locally.
    ///
    /// - Parameters:
    ///   - universities: The array of universities to be saved.
    ///   - completion: A closure to be executed after the save operation completes.
    func saveUniversities(_ universities: [University], completion: @escaping (_ error: Error?) -> Void) {
        // Implementation for saving universities locally goes here
    }
    
    /// Retrieves locally saved universities data.
    ///
    /// - Returns: An array of locally saved universities.
    func getLocalUniversities() -> [University] {
        // Implementation for retrieving locally saved universities goes here
        return []
    }
    
}
