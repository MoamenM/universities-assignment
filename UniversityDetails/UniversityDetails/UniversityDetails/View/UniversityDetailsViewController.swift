//
//  UniversityDetailsViewController.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import UIKit

/**
 Displays the details of a university.

 This view controller presents information about a university, such as its name, location, and website.
 */
class UniversityDetailsViewController: UIViewController, UniversityDetailsViewProtocol {

    // MARK: Outlets
    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    @IBOutlet weak var universityCountryLabel: UILabel!
    @IBOutlet weak var universityCountryCodeLabel: UILabel!
    @IBOutlet weak var universityWebPageButton: UIButton!

    
    // MARK: Variables
    /// The presenter responsible for managing the presentation logic.
    var presenter: UniversityDetailsPresenterProtocol!
    
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter.viewDidLoad()
    }
    
    
    // MARK: Helper methods
    /**
     Displays the details of the university.

     - Parameter university: The details of the university to display.
     */
    func showUniversityDetailsData(_ university: UniversityDetails) {
        universityNameLabel.text = university.name
        universityStateLabel.text = university.state
        universityCountryLabel.text = university.country
        universityCountryCodeLabel.text = university.countryCode
        universityWebPageButton.isHidden = !university.showUniversityWebsite
    }

    // MARK: Actions
    /**
     Handles the tap event on the refresh button.
     */
    @IBAction func refreshUniversitiesListButtonTappeed(_ sender: Any) {
        presenter.refreshData()
    }
    
    /**
     Handles the tap event on the web page button.
     */
    @IBAction func webPageButtonTapped(_ sender: Any) {
        presenter.showUniversityWebPage()
    }
    
}
