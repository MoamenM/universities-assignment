//
//  DatabaseManager.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 04/05/2024.
//

import RealmSwift

/**
 Manages interactions with the Realm database, providing methods for accessing and updating stored objects.
 */
class RealmManager {
    
    /// The shared instance of RealmManager.
    static let `default` = RealmManager()
    
    /// The Realm instance used for database operations.
    private let realm: Realm
    
    /// Initializes a new instance of RealmManager.
    private init() {
        realm = try! Realm()
    }
    
    
    /**
     Returns the file path of the default Realm configuration.
     
     - Returns: A string representing the absolute file path of the default Realm configuration, or an empty string if the file URL is nil.
     */
    static var path: String {
        return Realm.Configuration.defaultConfiguration.fileURL?.absoluteString ?? ""
    }
    
    /**
     Updates a list of objects in the Realm database, replacing any existing objects of the same type.
     
     - Parameter objects: The list of objects to update in the Realm database.
     */
    func updateList<T: Object>(_ objects: [T]) {
        do {
            try realm.write {
                // Retrieve existing objects of the same type, if any
                let existingObjects = realm.objects(T.self)
                
                // Delete existing objects
                realm.delete(existingObjects)
                
                // Add new objects to the Realm
                realm.add(objects)
            }
        } catch {
            print("Error updatee cached list: \(error)")
        }
    }
    
    /**
     Fetches all objects of a specific type from the Realm database.
     
     - Parameter type: The type of objects to fetch from the Realm.
     - Returns: A `Results` collection containing all objects of the specified type from the Realm, or `nil` if no objects are found.
     */
    func getList<T: Object>(type: T.Type) -> Results<T>? {
        return realm.objects(type)
    }
}
