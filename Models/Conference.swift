//
//  Conference.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftData
import SwiftUI

/// Represents a conference with details like title, summary, date, time, and relationships.
@Model
final class Conference {
    var title: String
    var summary: String
    var date: Date
    var startTime: Date
    var endTime: Date
    var isSelected: Bool
    var priority: Priority

    /// Relationship: A conference belongs to one room.
    @Relationship var room: Room

    /// Relationship: A conference can have multiple speakers.
    @Relationship var speakers: [Speaker]

    /// Relationship: A conference belongs to one theme.
    @Relationship var theme: Theme

    init(
        title: String,
        summary: String,
        date: Date,
        startTime: Date,
        endTime: Date,
        room: Room,
        speakers: [Speaker],
        theme: Theme,
        isSelected: Bool = false,
        priority: Priority = .nonSelectionnee
    ) {
        self.title = title
        self.summary = summary
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.isSelected = isSelected
        self.priority = priority
        self.room = room
        self.speakers = speakers
        self.theme = theme
    }

    /// Updates the selection and priority of the conference.
    func updateSelection(with priority: Priority) {
        if priority == .nonSelectionnee {
            self.isSelected = false
            self.priority = .nonSelectionnee
        } else {
            self.isSelected = true
            self.priority = priority
        }
    }

    /// Checks if this conference overlaps with any other selected conferences.
    func hasConflict(with otherConferences: [Conference]) -> Bool {
        guard isSelected else { return false }
        return otherConferences.contains { other in
            other.id != self.id &&
            other.isSelected &&
            (startTime < other.endTime && endTime > other.startTime)
        }
    }

    /// Returns the conflicting conferences.
    func conflictingConferences(in otherConferences: [Conference]) -> [Conference] {
        guard isSelected else { return [] }
        return otherConferences.filter { other in
            other.id != self.id &&
            other.isSelected &&
            (startTime < other.endTime && endTime > other.startTime)
        }
    }
}

// Extension to format dates for display
extension Conference {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: date)
    }

    var formattedTimeRange: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "fr_FR")
        return "\(formatter.string(from: startTime)) - \(formatter.string(from: endTime))"
    }
}
