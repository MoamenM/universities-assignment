//
//  UniversityTableViewCell.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import UIKit

/**
 Represents a table view cell for displaying university information.
 
 This custom UITableViewCell subclass conforms to the UniversitiesListCellViewProtocol, allowing it to be used in a table view to display data about universities.
 */
class UniversityTableViewCell: UITableViewCell, UniversitiesListCellViewProtocol {

    // MARK: Outlets
    /// Label for displaying the name of the university.
    @IBOutlet weak var universityNameLabel: UILabel!
    
    /// Label for displaying the state of the university.
    @IBOutlet weak var universityStateLabel: UILabel!
    
    
    // MARK: Native overridden methods
    /// Called after the view has been loaded.
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    /// Called when the cell is selected.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // MARK: Helper methods
    /// Sets up the UI of the cell.
    private func setupUI() {
        selectionStyle = .none
    }
    
    /// Configures the cell with the provided view model.
    ///
    /// - Parameter viewModel: The view model containing data to be displayed.
    func configure(viewModel: UniversityViewModel) {
        universityNameLabel.isHidden = !viewModel.showUniversityName
        universityNameLabel.text = viewModel.name
        
        universityStateLabel.isHidden = !viewModel.showUniversityState
        universityStateLabel.text = viewModel.state
    }
}
