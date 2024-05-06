//
//  UniversityDetailsRouter.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import UIKit

/**
 Handles navigation for university details.

 This class provides methods for navigating to different screens related to university details.
 */
public class UniversityDetailsRouter: UniversityDetailsRouterProtocol {
    
    /// Represents the possible routes for navigation in university details.
    enum Route {
        /// Shows the web page of the university.
        case showUniversityWebPage(websiteURL: URL)
        /// Refreshes data and dismisses the current screen.
        case refreshDataWithDismiss
    }
    
    private weak var viewController: UIViewController?
    private var refreshDataAction: (() -> Void)?
    
    /**
     Assembles the module for university details.

     - Parameters:
        - university: The details of the university to display.
        - refreshDataAction: An action to refresh data.
     - Returns: The assembled view controller for university details.
     */
    public static func assembleModule(university: UniversityDetails, refreshDataAction: (() -> Void)?) -> UIViewController {
        let bundle = Bundle(for: UniversityDetailsViewController.self)
        let view = UniversityDetailsViewController(nibName: "UniversityDetailsViewController", bundle: bundle)
        let router = UniversityDetailsRouter()
        let presenter = UniversityDetailsPresenter(university: university, view: view, router: router)
        view.presenter = presenter
        router.viewController = view
        router.refreshDataAction = refreshDataAction
        return view
    }
    
    /**
     Navigates to a specific route in university details.

     - Parameter route: The route to navigate to.
     */
    func go(to route: Route) {
        switch route {
        case .showUniversityWebPage(let websiteURL):
            openSafari(with: websiteURL)
            
        case .refreshDataWithDismiss:
            refreshDataAction?()
            viewController?.dismiss(animated: true)
        }
    }
    
    /**
     Opens the Safari browser with the specified website URL.

     - Parameter websiteURL: The URL of the website to open.
     */
    private func openSafari(with websiteURL: URL) {
        UIApplication.shared.open(websiteURL)
    }
    
}

