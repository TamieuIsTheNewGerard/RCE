//
//  DateUtils.swift
//  RCE
//
//  Created for the RCE project.
//

import Foundation

/// Utility functions for handling dates in the app.
enum DateUtils {
    /// Returns the current date without time components.
    static func todayWithoutTime() -> Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
    }

    /// Checks if a date is one of the event dates (13, 14, or 15 November 2026).
    static func isEventDate(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let eventDates = Constantes.Defaults.eventDates
        return eventDates.contains { calendar.isDate(date, inSameDayAs: $0) }
    }

    /// Returns the index of the event date (0 for 13/11, 1 for 14/11, 2 for 15/11).
    static func indexOfEventDate(_ date: Date) -> Int? {
        let calendar = Calendar.current
        let eventDates = Constantes.Defaults.eventDates
        return eventDates.firstIndex { calendar.isDate(date, inSameDayAs: $0) }
    }

    /// Returns the current event date index based on today's date.
    /// If today is before the event, returns 0 (first day).
    /// If today is during the event, returns the current day index.
    /// If today is after the event, returns the last day index.
    static func currentEventDateIndex() -> Int {
        let today = DateUtils.todayWithoutTime()
        let eventDates = Constantes.Defaults.eventDates

        // If today is before the first event date, return 0
        if today < eventDates[0] {
            return 0
        }

        // If today is during the event, return the current day index
        for (index, date) in eventDates.enumerated() {
            if Calendar.current.isDate(today, inSameDayAs: date) {
                return index
            }
        }

        // If today is after the last event date, return the last index
        return eventDates.count - 1
    }

    /// Formats a date to a short time string (e.g., "14:00").
    static func shortTimeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: date)
    }

    /// Formats a date to a medium date string (e.g., "13 nov. 2026").
    static func mediumDateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: date)
    }

    /// Formats a date range (e.g., "14:00 - 15:00").
    static func timeRangeString(start: Date, end: Date) -> String {
        "\(shortTimeString(from: start)) - \(shortTimeString(from: end))"
    }
}
