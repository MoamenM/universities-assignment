//
//  UniversitiesListProtocols.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import Foundation
import AppServices

/**
 Defines the contract for a view that displays a list of universities.
**/
protocol UniversitiesListViewProtocol: AnyObject {
    /// Reference to the presenter associated with the view.
    var presenter: UniversitiesListPresenterProtocol! { get set }
    
    /// Sets up the UI of the view.
    func setupUI()
    
    /// Shows a loading indicator.
    func showLoadingIndicator()
    
    /// Hides the loading indicator.
    func hideLoadingIndicator()
    
    /// Reloads the data displayed in the view.
    func reloadData()
}



/// Defines the contract for a presenter that handles logic for the universities list module.
protocol UniversitiesListPresenterProtocol: AnyObject {
    /// Reference to the view associated with the presenter.
    var view: UniversitiesListViewProtocol? { get set }
    
    /// Number of rows in the universities list.
    var numberOfRows: Int { get }
    
    /// Notifies the presenter that the view has loaded.
    func viewDidLoad()
    
    /// Configures a cell at the specified index path.
    ///
    /// - Parameters:
    ///   - cell: The cell to configure.
    ///   - indexPath: The index path of the cell.
    func configure(cell: UniversitiesListCellViewProtocol, indexPath: IndexPath)
    
    /// Notifies the presenter that a university has been selected.
    ///
    /// - Parameter row: The index of the selected university.
    func didSelectUniversity(at row: Int)
}



/// Defines the contract for a router that handles navigation for the universities list module.
protocol UniversitiesListRouterProtocol {
    /// Navigates to the specified route.
    ///
    /// - Parameter route: The route to navigate to.
    func go(to route: UniversitiesListRouter.Route)
}



/// Defines the contract for an interactor that handles data processing for the universities list module.
protocol UniversitiesListInteractorInputProtocol {
    /// Reference to the presenter associated with the interactor.
    var presenter: UniversitiesListInteractorOutputProtocol? { get set }
    
    /// Fetches the list of universities from the remote data source.
    func fetcUniversitiesList()
    
    /// Saves the provided list of universities to the local data source.
    ///
    /// - Parameter universities: The list of universities to save.
    func saveUniversities(_ universities: [University])
    
    /// Retrieves the list of universities from the local data source.
    ///
    /// - Returns: The list of universities stored locally.
    func getLocalUniversities() -> [University]
}



/// Defines the contract for an output delegate of the interactor.
protocol UniversitiesListInteractorOutputProtocol: AnyObject {
    /// Notifies the delegate that universities were fetched successfully.
    ///
    /// - Parameter universities: The list of fetched universities.
    func universitiesFetchedSuccessfully(universities: [University])
    
    /// Notifies the delegate that fetching universities failed.
    ///
    /// - Parameter error: The error that occurred during fetching.
    func universitiesFetchingFailed(withError error: Error)
    
    /// Notifies the delegate that saving universities failed.
    ///
    /// - Parameter error: The error that occurred during saving.
    func universitiesSavingFailed(withError error: Error)
}



/// Defines the contract for a worker that interacts with data sources for the universities list module.
protocol UniversitiesListWorkerProtocol {
    /// Fetches the list of universities from the remote data source.
    ///
    /// - Parameter completionHandler: Completion handler to be called when fetching completes.
    func fetchUniversities(completionHandler: @escaping (AppResult<[University]>) -> ())
    
    /// Saves the provided list of universities to the local data source.
    ///
    /// - Parameters:
    ///   - universities: The list of universities to save.
    ///   - completion: Completion handler to be called after saving.
    func saveUniversities(_ universities: [University], completion: @escaping (_ error: Error?) -> Void)
    
    /// Retrieves the list of universities from the local data source.
    ///
    /// - Returns: The list of universities stored locally.
    func getLocalUniversities() -> [University]
}



/// Defines the contract for a view that represents a cell in the universities list.
protocol UniversitiesListCellViewProtocol {
    /// Configures the cell with the provided view model.
    ///
    /// - Parameter viewModel: The view model containing data to configure the cell.
    func configure(viewModel: UniversityViewModel)
}
