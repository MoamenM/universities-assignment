//
//  UIViewController+Extension.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import UIKit

/// Provides convenience methods for displaying alerts in view controllers.
public extension UIViewController {
    
    /// Presents an alert with the specified title, message, and button title.
    ///
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - message: The message body of the alert.
    ///   - buttonTitle: The title text of the action button in the alert.
    ///   - action: An optional closure to be executed when the action button in the alert is tapped.
    func showAlert(title: String?, message: String?, buttonTitle: String, action: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            action?()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
