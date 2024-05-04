//
//  University.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 04/05/2024.
//

import Foundation
import RealmSwift

/**
 Represents a University entity that conforms to the Codable protocol for serialization and deserialization.

 This model defines properties for storing information about a university, such as its alpha-two code, name, country, domains, web pages, and state or province.
**/
struct University: Codable {
    let alphaTwoCode: String
    let name: String
    let country: String
    let domains: [String]
    let webPages: [String]
    let stateProvince: String?

    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case name, country, domains
        case webPages = "web_pages"
        case stateProvince = "state-province"
    }
}


/**
 Represents a University entity for storage in the Realm database.

 This class inherits from Realm's Object class, facilitating storage of University data in the Realm database.
***/
class UniversityObject: Object {
    @objc dynamic var alphaTwoCode: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""
    var domains = List<String>()
    var webPages = List<String>()
    @objc dynamic var stateProvince: String?
    
    convenience init(university: University) {
        self.init()
        self.alphaTwoCode = university.alphaTwoCode
        self.name = university.name
        self.country = university.country
        domains.append(objectsIn: university.domains)
        webPages.append(objectsIn: university.webPages)
        self.stateProvince = university.stateProvince
    }
}
