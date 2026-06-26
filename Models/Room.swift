//
//  Room.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftData
import SwiftUI

/// Represents a room where conferences can take place.
@Model
final class Room {
    var name: String

    /// Relationship: A room can have multiple conferences.
    @Relationship(deleteRule: .nullify, inverse: \Conference.room)
    var conferences: [Conference] = []

    init(name: String) {
        self.name = name
    }
}
