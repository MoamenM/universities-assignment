//
//  UniversitiesListPresenter.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import Foundation
import AppUIKit

/**
 Handles the presentation logic and interaction with the view and interactor for the universities list module.
 */
class UniversitiesListPresenter: UniversitiesListPresenterProtocol, UniversitiesListInteractorOutputProtocol {
    
    /// Reference to the view associated with the presenter.
    weak var view: UniversitiesListViewProtocol?
    
    /// Reference to the interactor associated with the presenter.
    private let interactor: UniversitiesListInteractorInputProtocol
    
    /// Reference to the router associated with the presenter.
    private let router: UniversitiesListRouterProtocol
    
    /// Array of universities fetched from the data source.
    private var universities = [University]()
    
    /// Number of rows in the universities list.
    var numberOfRows: Int {
        return universities.count
    }
    
    /// Initializes the presenter with the provided dependencies.
    ///
    /// - Parameters:
    ///   - view: The view associated with the presenter.
    ///   - interactor: The interactor associated with the presenter.
    ///   - router: The router associated with the presenter.
    init(view: UniversitiesListViewProtocol,
         interactor: UniversitiesListInteractorInputProtocol,
         router: UniversitiesListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    /// Handles the successful fetching of universities data.
    ///
    /// - Parameter universities: The list of universities fetched.
    private func handleFetchUniversities(universities: [University]) {
        view?.hideLoadingIndicator()
        self.universities = universities
        view?.reloadData()
    }
    
    /// Shows the failure state when fetching data.
    private func showFetchingDataFailureState() {
        let alertModel = AppAlertModel(title: "Error :(", message: "Can't load the universities list, please check your internet connection", buttonTitle: "Reload", buttonAction: { [weak self] in
            self?.fetcUniversitiesList()
        })
        router.go(to: .alert(alertModel: alertModel))
    }
    
    /// Refreshes the data.
    func refreshData() {
        print("Refresh Data")
    }
    
    /// Fetches the list of universities.
    private func fetcUniversitiesList () {
        view?.showLoadingIndicator()
        interactor.fetcUniversitiesList()
    }
    
    /// Notifies the presenter that the view has loaded.
    func viewDidLoad() {
        view?.setupUI()
        fetcUniversitiesList()
    }
    
    /// Handles the successful fetching of universities.
    ///
    /// - Parameter universities: The list of universities fetched.
    func universitiesFetchedSuccessfully(universities: [University]) {
        interactor.saveUniversities(universities)
        handleFetchUniversities(universities: universities)
    }
    
    /// Handles the failure in fetching universities.
    ///
    /// - Parameter error: The error that occurred during fetching.
    func universitiesFetchingFailed(withError error: Error) {
        let universities = interactor.getLocalUniversities()
        if !universities.isEmpty {
            handleFetchUniversities(universities: universities)
        } else {
            view?.hideLoadingIndicator()
            showFetchingDataFailureState()
        }
    }
    
    /// Handles the failure in saving universities.
    ///
    /// - Parameter error: The error that occurred during saving.
    func universitiesSavingFailed(withError error: Error) {
        print("Universities saving failed with error: \(error.localizedDescription)")
    }
    
    /// Configures the cell at the specified index path.
    ///
    /// - Parameters:
    ///   - cell: The cell to configure.
    ///   - indexPath: The index path of the cell.
    func configure(cell: UniversitiesListCellViewProtocol, indexPath: IndexPath) {
        let university = universities[indexPath.row]
        let viewModel = UniversityViewModel(name: university.name, state: university.stateProvince)
        cell.configure(viewModel: viewModel)
    }
    
    /// Handles the selection of a university at the specified row.
    ///
    /// - Parameter row: The index of the selected university.
    func didSelectUniversity(at row: Int) {
        if universities.indices.contains(row) {
            router.go(to: .cellSelectedAction(university: universities[row]))
        }
    }
    
}
