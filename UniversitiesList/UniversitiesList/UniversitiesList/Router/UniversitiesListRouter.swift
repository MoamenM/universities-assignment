//
//  UniversitiesListRouter.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import UIKit
import AppServices
import AppUIKit

/// Handles navigation and route management for the universities list module.
public class UniversitiesListRouter: UniversitiesListRouterProtocol {
    
    /// Enum defining the possible routes of the router.
    enum Route {
        case cellSelectedAction(university: University)
        case alert(alertModel: AppAlertModel)
    }
    
    
    /// Reference to the view controller associated with the router.
    weak var viewController: UIViewController?
    
    /// Reference to the presenter responsible for handling UI logic.
    private var presenter: UniversitiesListPresenter?
    
    /// Closure to be executed when a cell is selected.
    private var cellSelectedAction: ((_ university: University) -> Void)?
    
    
    /// Initializes a new `UniversitiesListRouter`.
    public init() { }
    
    
    /// Assembles and configures the module, returning the view controller.
    ///
    /// - Parameter cellSelectedAction: Closure to be executed when a cell is selected.
    /// - Returns: The assembled view controller for the universities list module.
    public func assembleModule(cellSelectedAction: ((_ university: University) -> Void)?) -> UIViewController {
        self.cellSelectedAction = cellSelectedAction
        let bundlee = Bundle(for: UniversitiesListViewController.self)
        let viewController = UniversitiesListViewController(nibName: "UniversitiesListViewController", bundle: bundlee)
        let networkLayer = APIService()
        let worker = UniversitiesListWorker(networkLayer: networkLayer)
        let interactor = UniversitiesListInteractor(worker: worker)
        presenter = UniversitiesListPresenter(view: viewController, interactor: interactor, router: self)
        viewController.presenter = presenter!
        interactor.presenter = presenter!
        self.viewController = viewController
        return viewController
    }
    
    
    /// Navigates to the specified route.
    ///
    /// - Parameter route: The route to navigate to.
    func go(to route: Route) {
        switch route {
        case .cellSelectedAction(let university):
            self.cellSelectedAction?(university)
        case let .alert(alertModel):
            showAlert(alertModel: alertModel)
        }
    }
    
}


public extension UniversitiesListRouter {
    
    /// Shows an alert with the provided alert model.
    ///
    /// - Parameter alertModel: The alert model containing title, message, and action details.
    private func showAlert(alertModel: AppAlertModel) {
        viewController?.showAlert(title: alertModel.title, message: alertModel.message,
                                  buttonTitle: alertModel.buttonTitle, action: alertModel.buttonAction)
        
    }
    
    /// Notifies the presenter to refresh data.
    func refreshData() {
        presenter?.refreshData()
    }
    
}
