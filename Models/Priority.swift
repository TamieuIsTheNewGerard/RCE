//
//  Priority.swift
//  RCE
//
//  Created for the RCE project.
//

import Foundation

/// Represents the priority level of a conference selection.
enum Priority: String, Codable {
    case nonSelectionnee = "Non sélectionnée"
    case haute = "Haute"
    case basse = "Basse"
}
