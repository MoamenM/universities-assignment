//
//  AppAlertModel.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import Foundation

/// Represents the data model for an alert displayed in the app.
public struct AppAlertModel {
        
    /// The title of the alert.
    public let title: String
    
    /// The message body of the alert.
    public let message: String
    
    /// The title text of the action button in the alert.
    public let buttonTitle: String
    
    /// The closure to be executed when the action button in the alert is tapped.
    public let buttonAction: (() -> Void)
    
    
    /// Initializes an instance of `AppAlertModel` with the specified parameters.
    ///
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - message: The message body of the alert.
    ///   - buttonTitle: The title text of the action button in the alert.
    ///   - buttonAction: The closure to be executed when the action button in the alert is tapped.
    public init(title: String, message: String, buttonTitle: String, buttonAction: @escaping () -> Void) {
        self.title = title
        self.message = message
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
    }

}
