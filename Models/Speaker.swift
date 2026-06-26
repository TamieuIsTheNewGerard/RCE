//
//  Speaker.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftData
import SwiftUI

/// Represents a speaker who can give multiple conferences.
@Model
final class Speaker {
    var firstName: String
    var lastName: String

    /// Relationship: A speaker can give multiple conferences.
    @Relationship(deleteRule: .nullify, inverse: \Conference.speakers)
    var conferences: [Conference] = []

    /// Computed property for full name.
    var fullName: String {
        "\(firstName) \(lastName)"
    }

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
