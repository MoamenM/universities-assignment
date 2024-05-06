//
//  University.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 04/05/2024.
//

import Foundation

/**
 Represents a University entity that conforms to the Codable protocol for serialization and deserialization.
 
 This model defines properties for storing information about a university, such as its alpha-two code, name, country, domains, web pages, and state or province.
 **/
public struct University: Codable {
    var alphaTwoCode: String?
    var name: String?
    var country: String?
    var domains: [String]?
    var webPages: [String]?
    var stateProvince: String?
    
    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case name, country, domains
        case webPages = "web_pages"
        case stateProvince = "state-province"
    }
}
