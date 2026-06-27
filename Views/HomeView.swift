//
//  HomeView.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftUI
import SwiftData

/// Displays the user's selected conferences in a planning view, organized by day.
struct HomeView: View {
    @Environment(\ModelContext) private var modelContext

    @Query(filter: #Predicate<Conference> { $0.isSelected }) private var selectedConferences: [Conference]
    @State private var selectedDayIndex: Int = DateUtils.currentEventDateIndex()

    private let eventDates = Constantes.Defaults.eventDates

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Day selector
                daySelector

                // Planning content
                planningContent
            }
            .navigationTitle(Constantes.Strings.planningTabTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - Subviews

    private var daySelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<eventDates.count, id: \.self) { index in
                    let date = eventDates[index]
                    let isSelected = index == selectedDayIndex

                    Button {
                        selectedDayIndex = index
                    } label: {
                        VStack(spacing: 4) {
                            Text(DateUtils.mediumDateString(from: date))
                                .font(.subheadline)
                                .foregroundColor(isSelected ? .white : .primary)

                            if isSelected {
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(height: 2)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(isSelected ? Color.blue : Color.clear)
                        .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 8)
        }
        .background(Color(.systemGroupedBackground))
    }

    private var planningContent: some View {
        Group {
            if selectedConferences.isEmpty {
                emptyState
            } else {
                conferenceList
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "calendar.badge.exclamationmark")
                .font(.system(size: 50))
                .foregroundColor(.gray)

            Text(Constantes.Strings.noConferencesSelected)
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

    private var conferenceList: some View {
        let filteredConferences = selectedConferences.filter { conference in
            Calendar.current.isDate(conference.date, inSameDayAs: eventDates[selectedDayIndex])
        }

        if filteredConferences.isEmpty {
            VStack(spacing: 16) {
                Image(systemName: "calendar.badge.minus")
                    .font(.system(size: 50))
                    .foregroundColor(.gray)

                Text("Aucune conférence sélectionnée pour ce jour.")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
        } else {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(filteredConferences) { conference in
                        let hasConflict = conference.hasConflict(with: selectedConferences)

                        ConferenceRow(
                            conference: conference,
                            showChevron: false,
                            showConflictIndicator: true,
                            hasConflict: hasConflict
                        )
                        .padding(.horizontal, 12)
                    }
                }
                .padding(.vertical, 12)
            }
            .background(Color(.systemBackground))
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

    HomeView()
        .modelContainer(container)
}
