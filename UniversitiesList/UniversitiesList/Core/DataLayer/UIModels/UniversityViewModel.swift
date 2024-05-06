//
//  UniversityViewModel.swift
//  UniversitiesList
//
//  Created by Mo'men Abd Elmageed on 06/05/2024.
//

import Foundation

/**
 Represents a view model for displaying University data in the user interface.
 
 This struct provides properties for presenting information about a university, including its name, country, country code, and website address.
 **/
struct UniversityViewModel {
    var name: String
    var state: String
    
    init(name: String?, state: String?) {
        self.name = name ?? ""
        self.state = state ?? ""
    }
    
    var showUniversityName: Bool {
        return !name.isEmpty
    }
    
    var showUniversityState: Bool {
        return !state.isEmpty
    }
    
}
