//
//  Constantes.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftUI

/// Contains all the constants used in the app, such as colors, strings, and default values.
enum Constantes {
    // MARK: - Colors
    /// Default colors for the app.
    enum Colors {
        static let primary = Color("PrimaryColor")
        static let secondary = Color("SecondaryColor")
        static let accent = Color("AccentColor")
        static let background = Color("BackgroundColor")
        static let text = Color("TextColor")
    }

    // MARK: - App Defaults
    /// Default values for the app.
    enum Defaults {
        static let eventDates: [Date] = {
            let calendar = Calendar.current
            let year = 2026
            let month = 11 // November
            return [
                calendar.date(from: DateComponents(year: year, month: month, day: 13))!,
                calendar.date(from: DateComponents(year: year, month: month, day: 14))!,
                calendar.date(from: DateComponents(year: year, month: month, day: 15))!
            ]
        }()
    }

    // MARK: - Strings
    /// Localized strings for the app.
    enum Strings {
        // Tab Bar
        static let planningTabTitle = "Planning"
        static let conferencesTabTitle = "Conférences"
        static let myConferencesTabTitle = "Mes conférences"

        // HomeView
        static let noConferencesSelected = "Aucune conférence sélectionnée"

        // ConferenceView
        static let searchPlaceholder = "Rechercher une conférence..."
        static let sortByDay = "Jour"
        static let sortByRoom = "Salle"
        static let sortByTheme = "Thème"

        // PrioritySheet
        static let choosePriorityTitle = "Choisir une priorité"
        static let highPriority = "Haute"
        static let lowPriority = "Basse"

        // Conflict Alert
        static let conflictAlertTitle = "Conflit de planning"
        static let conflictAlertMessage = "Cette conférence chevauche une ou plusieurs autres conférences sélectionnées. Voulez-vous la sélectionner quand même ?"
        static let conflictAlertConfirm = "Oui"
        static let conflictAlertCancel = "Annuler"

        // ConferenceDetailView
        static let selectButtonTitle = "Sélectionner"
        static let deselectButtonTitle = "Désélectionner"
    }

    // MARK: - Icons
    /// SF Symbols used in the app.
    enum Icons {
        static let planning = "calendar"
        static let conferences = "list.bullet"
        static let myConferences = "mic.fill"
        static let conflict = "exclamationmark.triangle.fill"
        static let checkmark = "checkmark.circle.fill"
        static let uncheckmark = "circle"
        static let chevronRight = "chevron.right"
        static let themeColorSwatch = "paintpalette"
        static let room = "house.fill"
        static let speaker = "person.fill"
        static let time = "clock.fill"
    }
}
