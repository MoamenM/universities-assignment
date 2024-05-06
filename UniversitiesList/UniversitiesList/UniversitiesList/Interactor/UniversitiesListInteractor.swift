//
//  UniversitiesListInteractor.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import Foundation

/**
 Handles the business logic and data manipulation for the universities list module.
 */
class UniversitiesListInteractor: UniversitiesListInteractorInputProtocol {
    
    /// Reference to the presenter associated with the interactor.
    weak var presenter: UniversitiesListInteractorOutputProtocol?
    
    /// The worker responsible for fetching and saving universities data.
    var universitiesListWorker: UniversitiesListWorkerProtocol
    
    /// Initializes the interactor with the provided worker.
    ///
    /// - Parameter worker: The worker responsible for fetching and saving universities data.
    init(worker: UniversitiesListWorkerProtocol) {
        self.universitiesListWorker = worker
    }
    
    /// Fetches the list of universities.
    func fetcUniversitiesList() {
        universitiesListWorker.fetchUniversities { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let universities):
                self.presenter?.universitiesFetchedSuccessfully(universities: universities)
            case .failure(let error):
                self.presenter?.universitiesFetchingFailed(withError: error)
            }
        }
    }
    
    /// Saves the list of universities.
    ///
    /// - Parameter universities: The list of universities to be saved.
    func saveUniversities(_ universities: [University]) {
        universitiesListWorker.saveUniversities(universities) { [weak self] error in
            guard let self = self, let error = error else { return }
            self.presenter?.universitiesFetchingFailed(withError: error)
        }
    }
    
    /// Retrieves the locally saved universities.
    ///
    /// - Returns: The list of universities saved locally.
    func getLocalUniversities() -> [University] {
        return universitiesListWorker.getLocalUniversities()
    }
    
}


