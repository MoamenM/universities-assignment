//
//  NSObject+Extension.swift
//  UniversitiesAssignment
//
//  Created by Mo'men Abd Elmageed on 05/05/2024.
//

import Foundation

/// A protocol for obtaining the class name of a type.
public protocol ClassNameProtocol {
    /// A computed property representing the class name of the conforming type.
    static var className: String { get }
}

public extension ClassNameProtocol {
    /// Returns the class name of the conforming type as a string.
    static var className: String {
        return String(describing: self)
    }
}

extension NSObject: ClassNameProtocol {}
