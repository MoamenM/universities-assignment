//
//  AppFlow.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import UIKit
import UniversitiesList
import UniversityDetails

/// Manages the flow of the application and sets up the initial view hierarchy.
class AppFlow {
    
    /// The shared instance of `AppFlow`.
    static var shared = AppFlow()
    
    /// The navigation controller used for managing view controllers.
    private var navigationController: UINavigationController
    
    /// The router for the universities list module.
    private var universitiesListRouter: UniversitiesListRouter
    
    
    /// Initializes a new instance of `AppFlow`.
    private init() {
        navigationController = UINavigationController()
        universitiesListRouter = UniversitiesListRouter()
    }
    
    
    /// Starts the flow of the application by configuring the initial view hierarchy.
    ///
    /// - Parameter window: The application's window.
    func startAppFlow(with window: UIWindow?) {
        guard let window = window else {
            fatalError("Application window not exist, it is nil")
        }
        
        let navigationController = UINavigationController()
        let viewController = universitiesListRouter.assembleModule(cellSelectedAction: { [weak self] university in
            guard let self = self else { return }
            self.showUniversityDetails(university: university)
        })
        navigationController.viewControllers = [viewController]
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
    /**
     Presents a view controller to display details of a university.

     - Parameter university: The university object containing details to be displayed.
     */
    private func showUniversityDetails(university: University) {
        let universityDetails = UniversityDetails(name: university.name, country: university.country,
                                                  state: university.stateProvince, countryCode: university.alphaTwoCode,
                                                  websiteAddress: university.webPages?.first)
        let viewController = UniversityDetailsRouter.assembleModule(university: universityDetails, refreshDataAction: { [weak self] in
            guard let self = self else { return }
            self.universitiesListRouter.refreshData()
        })
        
        universitiesListRouter.viewController?.present(viewController, animated: true)
    }
    
}
