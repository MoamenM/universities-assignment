//
//  UniversityDetails.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import Foundation

/**
 Represents details of a university.

 This struct holds information about a university such as its name, country, state, country code, and website address.

 - Parameters:
    - name: The name of the university.
    - country: The country where the university is located.
    - state: The state or province where the university is located.
    - countryCode: The alpha-2 country code of the university.
    - websiteAddress: The website address of the university.
 */
public struct UniversityDetails {
    var name: String
    var country: String
    var state: String
    var countryCode: String
    var websiteAddress: String
    
    
    /**
     Initializes a new UniversityDetails instance.
     
     - Parameters:
        - name: The name of the university.
        - country: The country where the university is located.
        - state: The state or province where the university is located.
        - countryCode: The alpha-2 country code of the university.
        - websiteAddress: The website address of the university.
     */
    public init(name: String?, country: String?, state: String?, countryCode: String?, websiteAddress: String?) {
        self.name = name ?? ""
        self.country = country ?? ""
        self.state = state ?? ""
        self.countryCode = countryCode ?? ""
        self.websiteAddress = websiteAddress ?? ""
    }
    
    /// The URL of the university's website.
    var websiteURL: URL? {
        return URL(string: websiteAddress)
    }
    
    /// A boolean value indicating whether the university has a website.
    var showUniversityWebsite: Bool {
        return websiteURL != nil
    }
}
