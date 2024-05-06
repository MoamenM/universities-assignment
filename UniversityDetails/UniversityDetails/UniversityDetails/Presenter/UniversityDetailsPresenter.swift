//
//  UniversityDetailsPresenter.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import Foundation

/**
 Handles the presentation logic for university details.

 This class manages the presentation of university details and responds to user interactions.
 */
class UniversityDetailsPresenter: UniversityDetailsPresenterProtocol {

    /// A weak reference to the view displaying university details.
    weak var view: UniversityDetailsViewProtocol?
    /// The router for navigating to other screens related to university details.
    private let router: UniversityDetailsRouterProtocol
    /// The details of the university being presented.
    private var university: UniversityDetails
    
    
    /**
     Initializes the presenter with university details, a view, and a router.

     - Parameters:
        - university: The details of the university to present.
        - view: The view displaying university details.
        - router: The router for navigation.
     */
    init(university: UniversityDetails, view: UniversityDetailsViewProtocol,
         router: UniversityDetailsRouterProtocol) {
        self.university = university
        self.view = view
        self.router = router
    }
    
    /**
     Called when the view has finished loading.
     */
    func viewDidLoad() {
        view?.showUniversityDetailsData(university)
    }
    
    /**
     Refreshes data and dismisses the current screen.
     */
    func refreshData() {
        router.go(to: .refreshDataWithDismiss)
    }
    
    /**
     Shows the university web page.
     */
    func showUniversityWebPage() {
        guard let websiteURL = university.websiteURL else { return }
        router.go(to: .showUniversityWebPage(websiteURL: websiteURL))
    }
    
}
