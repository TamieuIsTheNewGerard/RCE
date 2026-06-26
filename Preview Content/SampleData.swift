//
//  SampleData.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftUI
import SwiftData

/// Provides sample data for previews and testing.
enum SampleData {
    static func createSampleData() -> ModelContainer {
        let config = ModelConfiguration(url: URL(fileURLWithPath: "/dev/null"))
        let container = try! ModelContainer(for: Conference.self, configurations: config)

        // Create themes
        let theme1 = Theme(name: "Astronomie", color: .blue)
        let theme2 = Theme(name: "Exploration spatiale", color: .green)
        let theme3 = Theme(name: "Physique quantique", color: .purple)
        let theme4 = Theme(name: "Astrobiologie", color: .orange)
        let theme5 = Theme(name: "Cosmologie", color: .red)

        // Create rooms
        let amphitheatre1 = Room(name: "Amphithéâtre 1")
        let amphitheatre2 = Room(name: "Amphithéâtre 2")
        let salleA = Room(name: "Salle A")
        let salleB = Room(name: "Salle B")
        let salleC = Room(name: "Salle C")
        let salleD = Room(name: "Salle D")

        // Create speakers
        let jeanDupont = Speaker(firstName: "Jean", lastName: "Dupont")
        let marieMartin = Speaker(firstName: "Marie", lastName: "Martin")
        let pierreBernard = Speaker(firstName: "Pierre", lastName: "Bernard")
        let sophieDurand = Speaker(firstName: "Sophie", lastName: "Durand")
        let lucLemoine = Speaker(firstName: "Luc", lastName: "Lemoine")
        let claireFontaine = Speaker(firstName: "Claire", lastName: "Fontaine")

        // Create conferences for Day 1 (13/11/2026)
        let calendar = Calendar.current

        // Day 1: 13/11/2026
        let day1Start1 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 9, minute: 0))!
        let day1End1 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 10, minute: 0))!
        let conference1 = Conference(
            title: "Les mystères de l'univers",
            summary: "Une conférence passionnante sur les mystères de l'univers. Nous explorerons les trous noirs, les galaxies lointaines, et les phénomènes cosmiques les plus intrigants.",
            date: day1Start1,
            startTime: day1Start1,
            endTime: day1End1,
            room: amphitheatre1,
            speakers: [jeanDupont],
            theme: theme1
        )

        let day1Start2 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 10, minute: 30))!
        let day1End2 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 11, minute: 30))!
        let conference2 = Conference(
            title: "Voyage vers Mars",
            summary: "Les défis de la colonisation de Mars et les technologies nécessaires pour y parvenir.",
            date: day1Start2,
            startTime: day1Start2,
            endTime: day1End2,
            room: salleA,
            speakers: [marieMartin, pierreBernard],
            theme: theme2
        )

        let day1Start3 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 14, minute: 0))!
        let day1End3 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 15, minute: 0))!
        let conference3 = Conference(
            title: "Les trous noirs",
            summary: "Comprendre les trous noirs et leur rôle dans l'évolution des galaxies.",
            date: day1Start3,
            startTime: day1Start3,
            endTime: day1End3,
            room: amphitheatre2,
            speakers: [sophieDurand],
            theme: theme1
        )

        let day1Start4 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 15, minute: 30))!
        let day1End4 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 16, minute: 30))!
        let conference4 = Conference(
            title: "La vie dans l'univers",
            summary: "Recherche de la vie extraterrestre et conditions nécessaires à son développement.",
            date: day1Start4,
            startTime: day1Start4,
            endTime: day1End4,
            room: salleB,
            speakers: [lucLemoine],
            theme: theme4
        )

        // Day 2: 14/11/2026
        let day2Start1 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 14, hour: 9, minute: 0))!
        let day2End1 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 14, hour: 10, minute: 0))!
        let conference5 = Conference(
            title: "Les exoplanètes",
            summary: "Découverte des planètes en dehors de notre système solaire et leur potentiel pour abriter la vie.",
            date: day2Start1,
            startTime: day2Start1,
            endTime: day2End1,
            room: amphitheatre1,
            speakers: [marieMartin],
            theme: theme1
        )

        let day2Start2 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 14, hour: 10, minute: 30))!
        let day2End2 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 14, hour: 11, minute: 30))!
        let conference6 = Conference(
            title: "Les missions Apollo",
            summary: "Retour sur les missions Apollo et leur impact sur l'exploration spatiale.",
            date: day2Start2,
            startTime: day2Start2,
            endTime: day2End2,
            room: salleC,
            speakers: [pierreBernard, claireFontaine],
            theme: theme2
        )

        let day2Start3 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 14, hour: 14, minute: 0))!
        let day2End3 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 14, hour: 15, minute: 0))!
        let conference7 = Conference(
            title: "La théorie des cordes",
            summary: "Introduction à la théorie des cordes et ses implications pour la physique moderne.",
            date: day2Start3,
            startTime: day2Start3,
            endTime: day2End3,
            room: amphitheatre2,
            speakers: [sophieDurand, lucLemoine],
            theme: theme3
        )

        let day2Start4 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 14, hour: 15, minute: 30))!
        let day2End4 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 14, hour: 16, minute: 30))!
        let conference8 = Conference(
            title: "Les origines de l'univers",
            summary: "Exploration des théories sur les origines de l'univers et du Big Bang.",
            date: day2Start4,
            startTime: day2Start4,
            endTime: day2End4,
            room: salleD,
            speakers: [jeanDupont],
            theme: theme5
        )

        // Day 3: 15/11/2026
        let day3Start1 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 15, hour: 9, minute: 0))!
        let day3End1 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 15, hour: 10, minute: 0))!
        let conference9 = Conference(
            title: "Les galaxies lointaines",
            summary: "Observation et étude des galaxies les plus éloignées de notre univers.",
            date: day3Start1,
            startTime: day3Start1,
            endTime: day3End1,
            room: amphitheatre1,
            speakers: [claireFontaine],
            theme: theme1
        )

        let day3Start2 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 15, hour: 10, minute: 30))!
        let day3End2 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 15, hour: 11, minute: 30))!
        let conference10 = Conference(
            title: "Les satellites naturels",
            summary: "Étude des lunes et autres satellites naturels dans notre système solaire.",
            date: day3Start2,
            startTime: day3Start2,
            endTime: day3End2,
            room: salleA,
            speakers: [lucLemoine, jeanDupont],
            theme: theme2
        )

        let day3Start3 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 15, hour: 14, minute: 0))!
        let day3End3 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 15, hour: 15, minute: 0))!
        let conference11 = Conference(
            title: "La matière noire",
            summary: "Comprendre la matière noire et son rôle dans la structure de l'univers.",
            date: day3Start3,
            startTime: day3Start3,
            endTime: day3End3,
            room: amphitheatre2,
            speakers: [sophieDurand, pierreBernard],
            theme: theme5
        )

        let day3Start4 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 15, hour: 15, minute: 30))!
        let day3End4 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 15, hour: 16, minute: 30))!
        let conference12 = Conference(
            title: "L'avenir de l'exploration spatiale",
            summary: "Les prochaines étapes de l'exploration spatiale et les technologies émergentes.",
            date: day3Start4,
            startTime: day3Start4,
            endTime: day3End4,
            room: salleB,
            speakers: [marieMartin, claireFontaine],
            theme: theme2
        )

        // Insert all data into the model context
        container.mainContext.insert(theme1)
        container.mainContext.insert(theme2)
        container.mainContext.insert(theme3)
        container.mainContext.insert(theme4)
        container.mainContext.insert(theme5)

        container.mainContext.insert(amphitheatre1)
        container.mainContext.insert(amphitheatre2)
        container.mainContext.insert(salleA)
        container.mainContext.insert(salleB)
        container.mainContext.insert(salleC)
        container.mainContext.insert(salleD)

        container.mainContext.insert(jeanDupont)
        container.mainContext.insert(marieMartin)
        container.mainContext.insert(pierreBernard)
        container.mainContext.insert(sophieDurand)
        container.mainContext.insert(lucLemoine)
        container.mainContext.insert(claireFontaine)

        container.mainContext.insert(conference1)
        container.mainContext.insert(conference2)
        container.mainContext.insert(conference3)
        container.mainContext.insert(conference4)
        container.mainContext.insert(conference5)
        container.mainContext.insert(conference6)
        container.mainContext.insert(conference7)
        container.mainContext.insert(conference8)
        container.mainContext.insert(conference9)
        container.mainContext.insert(conference10)
        container.mainContext.insert(conference11)
        container.mainContext.insert(conference12)

        return container
    }
}
