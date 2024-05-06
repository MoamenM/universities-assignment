//
//  AppFlow.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import UIKit
import UniversitiesList

/// Manages the flow of the application and sets up the initial view hierarchy.
class AppFlow {
    
    /// The shared instance of `AppFlow`.
    static var shared = AppFlow()
    
    /// The navigation controller used for managing view controllers.
    private var navigationController: UINavigationController
    
    /// The router for the universities list module.
    var universitiesListRouter: UniversitiesListRouter
    
    
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
        let universitiesListViewController = universitiesListRouter.assembleModule(cellSelectedAction: { [weak self] university in
            guard let self = self else { return }
            self.universitiesListRouter.refreshData()
        })
        navigationController.viewControllers = [universitiesListViewController]
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
