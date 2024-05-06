//
//  UITableView+Extension.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import UIKit

/// Provides convenience methods for working with UITableView.
public extension UITableView {
    
    /// Registers a UITableViewCell subclass for use in the table view.
    ///
    /// - Parameter cellType: The type of the UITableViewCell subclass to register.
    func register<T: UITableViewCell>(cellType: T.Type) {
        let nib = UINib(nibName: cellType.className, bundle: Bundle(for: cellType))
        register(nib, forCellReuseIdentifier: cellType.className)
    }
    
    /// Dequeues a reusable table view cell of the specified type for the given index path.
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// - Returns: A reusable table view cell of the specified type.
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T
        else {
            fatalError("Couldn't find UITableViewCell for \(String(describing: T.className)), make sure the cell is registered with table view")
        }
        return cell
    }
}
