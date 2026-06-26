//
//  ConferenceDetailView.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftUI
import SwiftData

/// Displays detailed information about a conference.
struct ConferenceDetailView: View {
    @Environment(\ModelContext) private var modelContext
    @Environment(\dismiss) private var dismiss

    @Bindable var conference: Conference
    @State private var showPrioritySheet = false
    @State private var showConflictAlert = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Theme
                HStack(spacing: 8) {
                    Rectangle()
                        .fill(conference.theme.color.color)
                        .frame(width: 6, height: 24)
                        .cornerRadius(3)

                    Text(conference.theme.name)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // Title
                Text(conference.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical, 4)

                // Room, Date, and Time
                HStack(spacing: 16) {
                    HStack(spacing: 4) {
                        Image(systemName: Constantes.Icons.room)
                        Text(conference.room.name)
                    }

                    HStack(spacing: 4) {
                        Image(systemName: Constantes.Icons.time)
                        Text(conference.formattedDate)
                    }

                    HStack(spacing: 4) {
                        Image(systemName: Constantes.Icons.time)
                        Text(conference.formattedTimeRange)
                    }
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                // Speakers
                if !conference.speakers.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Conférenciers")
                            .font(.headline)

                        ForEach(conference.speakers) { speaker in
                            HStack(spacing: 8) {
                                Image(systemName: Constantes.Icons.speaker)
                                Text(speaker.fullName)
                            }
                            .font(.subheadline)
                        }
                    }

                    Divider()
                }

                // Summary
                VStack(alignment: .leading, spacing: 8) {
                    Text("Résumé")
                        .font(.headline)

                    Text(conference.summary)
                        .font(.body)
                        .foregroundColor(.primary)
                }

                Spacer()

                // Selection button
                selectionButton
                    .padding(.vertical, 16)
            }
            .padding()
        }
        .navigationTitle("Détails")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showPrioritySheet) {
            PrioritySheet(conference: conference, isPresented: $showPrioritySheet)
        }
        .alert(
            Constantes.Strings.conflictAlertTitle,
            isPresented: $showConflictAlert,
            actions: {
                Button(Constantes.Strings.conflictAlertConfirm, role: .destructive) {
                    conference.updateSelection(with: .haute)
                }
                Button(Constantes.Strings.conflictAlertCancel, role: .cancel) { }
            },
            message: {
                Text(Constantes.Strings.conflictAlertMessage)
            }
        )
    }

    // MARK: - Subviews

    private var selectionButton: some View {
        Button(action: toggleSelection) {
            HStack {
                Spacer()

                if conference.isSelected {
                    HStack(spacing: 8) {
                        Image(systemName: Constantes.Icons.checkmark)
                        Text(Constantes.Strings.deselectButtonTitle)
                    }
                } else {
                    HStack(spacing: 8) {
                        Image(systemName: Constantes.Icons.uncheckmark)
                        Text(Constantes.Strings.selectButtonTitle)
                    }
                }

                Spacer()
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(conference.isSelected ? Color.red : Color.blue)
            .cornerRadius(10)
        }
    }

    // MARK: - Actions

    private func toggleSelection() {
        if conference.isSelected {
            // Deselect the conference
            conference.updateSelection(with: .nonSelectionnee)
        } else {
            // Check for conflicts with other selected conferences
            let fetchDescriptor = FetchDescriptor<Conference>(
                predicate: #Predicate<Conference> { $0.isSelected }
            )
            do {
                let selectedConferences = try modelContext.fetch(fetchDescriptor)
                let conflictingConferences = conference.conflictingConferences(in: selectedConferences)

                if !conflictingConferences.isEmpty {
                    // Show conflict alert
                    showConflictAlert = true
                } else {
                    // Show priority sheet
                    showPrioritySheet = true
                }
            } catch {
                print("Error fetching selected conferences: \(error)")
                // Fallback: Show priority sheet
                showPrioritySheet = true
            }
        }
    }
}

// Preview
#Preview {
    let config = ModelConfiguration(url: URL(fileURLWithPath: "/dev/null"))
    let container = try! ModelContainer(for: Conference.self, configurations: config)

    // Create sample data
    let theme = Theme(name: "Astronomie", color: .blue)
    let room = Room(name: "Amphithéâtre 1")
    let speaker = Speaker(firstName: "Jean", lastName: "Dupont")

    let calendar = Calendar.current
    let startTime = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 14, minute: 0))!
    let endTime = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 15, minute: 0))!

    let conference = Conference(
        title: "Les mystères de l'univers",
        summary: "Une conférence passionnante sur les mystères de l'univers. Nous explorerons les trous noirs, les galaxies lointaines, et les phénomènes cosmiques les plus intrigants. Rejoignez-nous pour un voyage à travers l'espace et le temps.",
        date: startTime,
        startTime: startTime,
        endTime: endTime,
        room: room,
        speakers: [speaker],
        theme: theme
    )

    // Insert into model context
    container.mainContext.insert(theme)
    container.mainContext.insert(room)
    container.mainContext.insert(speaker)
    container.mainContext.insert(conference)

    return ConferenceDetailView(conference: conference)
        .modelContainer(container)
}
