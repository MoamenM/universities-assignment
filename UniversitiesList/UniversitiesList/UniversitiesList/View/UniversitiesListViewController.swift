//
//  UniversitiesListViewController.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import UIKit

/**
 A view controller responsible for displaying a list of universities.
 */
class UniversitiesListViewController: UIViewController, UniversitiesListViewProtocol {

    // MARK: Outlets
    
    /// Table view for displaying the list of universities.
    @IBOutlet weak var universitiesTableView: UITableView!
    
    /// Activity indicator for indicating loading state.
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    

    // MARK: Variables
    
    /// The presenter object responsible for managing the view's data.
    var presenter: UniversitiesListPresenterProtocol!
    
    
    
    // MARK: View lifecycle
    
    /// Called after the view has been loaded.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    
    // MARK: Helper methods
    
    /// Sets up the UI elements of the view.
    func setupUI() {
        title = "UAE Universities List"
        setupTableView()
    }
    
    /// Sets up the table view.
    private func setupTableView() {
        universitiesTableView.dataSource = self
        universitiesTableView.delegate = self
        registerTableViewCell()
    }
    
    /// Registers the table view cell for reuse.
    func registerTableViewCell() {
        universitiesTableView.register(cellType: UniversityTableViewCell.self)
    }
    
    /// Shows the loading indicator.
    func showLoadingIndicator() {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    /// Hides the loading indicator.
    func hideLoadingIndicator() {
        loadingIndicator.stopAnimating()
    }
    
    /// Reloads the data of the table view.
    func reloadData() {
        universitiesTableView.reloadData()
    }

}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension UniversitiesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// Asks the data source to return the number of rows in a specified section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    /// Asks the data source for a cell to insert in a particular location of the table view.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UniversityTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        presenter.configure(cell: cell, indexPath: indexPath)
        return cell
    }
    
    /// Tells the delegate that the specified row is now selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectUniversity(at: indexPath.row)
    }
}
