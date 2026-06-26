//
//  MesConferencesView.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftUI
import SwiftData

/// Displays a list of the user's selected conferences, sortable by day, room, or theme.
struct MesConferencesView: View {
    @Environment(\ModelContext) private var modelContext

    @Query private var conferences: [Conference]
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

                // Conference list or empty state
                conferenceList
            }
            .navigationTitle(Constantes.Strings.myConferencesTabTitle)
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
        Group {
            if selectedConferences.isEmpty {
                emptyState
            } else {
                conferenceListContent
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "mic.slash.fill")
                .font(.system(size: 50))
                .foregroundColor(.gray)

            Text("Aucune conférence sélectionnée")
                .font(.title)
                .foregroundColor(.gray)

            Text("Ajoutez des conférences depuis l'onglet 'Conférences'.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }

    private var conferenceListContent: some View {
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

    private var selectedConferences: [Conference] {
        conferences.filter { $0.isSelected }
    }

    private var sortedAndFilteredConferences: [Conference] {
        var filteredConferences = selectedConferences

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

// Preview
#Preview {
    let config = ModelConfiguration(url: URL(fileURLWithPath: "/dev/null"))
    let container = try! ModelContainer(for: Conference.self, configurations: config)

    // Create sample data
    let theme1 = Theme(name: "Astronomie", color: .blue)
    let theme2 = Theme(name: "Exploration spatiale", color: .green)

    let room1 = Room(name: "Amphithéâtre 1")
    let room2 = Room(name: "Salle A")

    let speaker1 = Speaker(firstName: "Jean", lastName: "Dupont")
    let speaker2 = Speaker(firstName: "Marie", lastName: "Martin")

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
    conference1.updateSelection(with: .haute)

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
    conference2.updateSelection(with: .basse)

    // Insert into model context
    container.mainContext.insert(theme1)
    container.mainContext.insert(theme2)
    container.mainContext.insert(room1)
    container.mainContext.insert(room2)
    container.mainContext.insert(speaker1)
    container.mainContext.insert(speaker2)
    container.mainContext.insert(conference1)
    container.mainContext.insert(conference2)

    return MesConferencesView()
        .modelContainer(container)
}
