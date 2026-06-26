//
//  ConferenceView.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftUI
import SwiftData

/// Displays a list of all conferences, sortable by day, room, or theme.
struct ConferenceView: View {
    @Environment(\ModelContext) private var modelContext

    @Query private var conferences: [Conference]
    @Query private var rooms: [Room]
    @Query private var themes: [Theme]

    @State private var searchText = ""
    @State private var sortCriteria: SortCriteria = .day
    @State private var selectedConference: Conference?

    enum SortCriteria: String, CaseIterable {
        case day = "Jour"
        case room = "Salle"
        case theme = "Thème"
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Search bar
                searchBar

                // Sort picker
                sortPicker

                // Conference list
                conferenceList
            }
            .navigationTitle(Constantes.Strings.conferencesTabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $selectedConference) { conference in
                ConferenceDetailView(conference: conference)
            }
        }
    }

    // MARK: - Subviews

    private var searchBar: some View {
        SearchBar(text: $searchText, placeholder: Constantes.Strings.searchPlaceholder)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color(.systemGroupedBackground))
    }

    private var sortPicker: some View {
        Picker("Trier par", selection: $sortCriteria) {
            ForEach(SortCriteria.allCases, id: \.self) { criteria in
                Text(criteria.rawValue).tag(criteria)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color(.systemGroupedBackground))
    }

    private var conferenceList: some View {
        List {
            ForEach(sortedAndFilteredConferences) { conference in
                ConferenceRow(
                    conference: conference,
                    showChevron: true,
                    showConflictIndicator: false,
                    hasConflict: false
                )
                .onTapGesture {
                    selectedConference = conference
                }
            }
        }
        .listStyle(.plain)
        .background(Color(.systemBackground))
    }

    // MARK: - Computed Properties

    private var sortedAndFilteredConferences: [Conference] {
        var filteredConferences = conferences

        // Filter by search text
        if !searchText.isEmpty {
            filteredConferences = filteredConferences.filter { conference in
                conference.title.localizedCaseInsensitiveContains(searchText) ||
                conference.summary.localizedCaseInsensitiveContains(searchText) ||
                conference.speakers.contains { speaker in
                    speaker.fullName.localizedCaseInsensitiveContains(searchText)
                }
            }
        }

        // Sort by criteria
        switch sortCriteria {
        case .day:
            return filteredConferences.sorted { $0.date < $1.date }
        case .room:
            return filteredConferences.sorted { $0.room.name < $1.room.name }
        case .theme:
            return filteredConferences.sorted { $0.theme.name < $1.theme.name }
        }
    }
}

// MARK: - Search Bar Component

struct SearchBar: View {
    @Binding var text: String
    let placeholder: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)

            TextField(placeholder, text: $text)
                .autocorrectionDisabled()

            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(8)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

// Preview
#Preview {
    let config = ModelConfiguration(url: URL(fileURLWithPath: "/dev/null"))
    let container = try! ModelContainer(for: Conference.self, configurations: config)

    // Create sample data
    let theme1 = Theme(name: "Astronomie", color: .blue)
    let theme2 = Theme(name: "Exploration spatiale", color: .green)

    let room1 = Room(name: "Amphithéâtre 1")
    let room2 = Room(name: "Salle A")
    let room3 = Room(name: "Salle B")

    let speaker1 = Speaker(firstName: "Jean", lastName: "Dupont")
    let speaker2 = Speaker(firstName: "Marie", lastName: "Martin")
    let speaker3 = Speaker(firstName: "Pierre", lastName: "Bernard")

    let calendar = Calendar.current

    // Day 1: 13/11/2026
    let day1Start1 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 9, minute: 0))!
    let day1End1 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 10, minute: 0))!
    let conference1 = Conference(
        title: "Les mystères de l'univers",
        summary: "Une conférence passionnante sur les mystères de l'univers.",
        date: day1Start1,
        startTime: day1Start1,
        endTime: day1End1,
        room: room1,
        speakers: [speaker1],
        theme: theme1
    )

    let day1Start2 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 14, minute: 0))!
    let day1End2 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 15, minute: 0))!
    let conference2 = Conference(
        title: "Voyage vers Mars",
        summary: "Les défis de la colonisation de Mars.",
        date: day1Start2,
        startTime: day1Start2,
        endTime: day1End2,
        room: room2,
        speakers: [speaker2],
        theme: theme2
    )

    // Day 2: 14/11/2026
    let day2Start1 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 14, hour: 10, minute: 0))!
    let day2End1 = calendar.date(from: DateComponents(year: 2026, month: 11, day: 14, hour: 11, minute: 0))!
    let conference3 = Conference(
        title: "Les exoplanètes",
        summary: "Découverte des planètes en dehors de notre système solaire.",
        date: day2Start1,
        startTime: day2Start1,
        endTime: day2End1,
        room: room3,
        speakers: [speaker3],
        theme: theme1
    )

    // Insert into model context
    container.mainContext.insert(theme1)
    container.mainContext.insert(theme2)
    container.mainContext.insert(room1)
    container.mainContext.insert(room2)
    container.mainContext.insert(room3)
    container.mainContext.insert(speaker1)
    container.mainContext.insert(speaker2)
    container.mainContext.insert(speaker3)
    container.mainContext.insert(conference1)
    container.mainContext.insert(conference2)
    container.mainContext.insert(conference3)

    return ConferenceView()
        .modelContainer(container)
}
