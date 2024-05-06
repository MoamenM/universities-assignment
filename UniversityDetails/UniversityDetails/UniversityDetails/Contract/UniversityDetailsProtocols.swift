//
//  UniversityDetailsProtocols.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import Foundation

/**
 Defines the contract for a view that displays details of a university.

 This protocol defines methods for updating the view with university details.
 */
protocol UniversityDetailsViewProtocol: AnyObject {
    var presenter: UniversityDetailsPresenterProtocol! { get set }
    
    /**
     Displays the details of a university.
     
     - Parameter university: The details of the university to be displayed.
     */
    func showUniversityDetailsData(_ university: UniversityDetails)
}

/**
 Defines the contract for a presenter that manages university details.

 This protocol defines methods for handling events related to university details.
 */
protocol UniversityDetailsPresenterProtocol: AnyObject {
    var view: UniversityDetailsViewProtocol? { get set }
    
    /**
     Notifies the presenter that the view has loaded.
     */
    func viewDidLoad()
    
    /**
     Refreshes the data displayed in the view.
     */
    func refreshData()
    
    /**
     Shows the web page of the university.
     */
    func showUniversityWebPage()
}

/**
 Defines the contract for a router that handles navigation for university details.

 This protocol defines a method for navigating to different screens related to university details.
 */
protocol UniversityDetailsRouterProtocol {
    
    /**
     Navigates to a specific route.
     
     - Parameter route: The route to navigate to.
     */
    func go(to route: UniversityDetailsRouter.Route)
}
