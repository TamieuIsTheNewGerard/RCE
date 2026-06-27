//
//  ConferenceRow.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftUI
import SwiftData

/// A reusable row component for displaying a conference in a list.
struct ConferenceRow: View {
    @Bindable var conference: Conference
    let showChevron: Bool
    let showConflictIndicator: Bool
    let hasConflict: Bool

    @State private var showPrioritySheet = false
    @State private var showConflictAlert = false

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            // Theme color swatch
            Rectangle()
                .fill(conference.theme.color.color)
                .frame(width: 6, height: 40)
                .cornerRadius(3)

            // Conference details
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .firstTextBaseline) {
                    Text(conference.title)
                        .font(.headline)
                        .lineLimit(1)

                    if hasConflict && showConflictIndicator {
                        Image(systemName: Constantes.Icons.conflict)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }

                HStack {
                    Text(conference.room.name)
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Spacer()

                    Text(conference.formattedTimeRange)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                if !conference.speakers.isEmpty {
                    Text(conference.speakers.map { $0.fullName }.joined(separator: ", "))
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }

            Spacer()

            // Selection checkbox
            Button(action: toggleSelection) {
                Image(systemName: conference.isSelected ? Constantes.Icons.checkmark : Constantes.Icons.uncheckmark)
                    .foregroundColor(conference.isSelected ? .blue : .gray)
                    .font(.title2)
            }
            .buttonStyle(.plain)

            // Chevron for navigation
            if showChevron {
                Image(systemName: Constantes.Icons.chevronRight)
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 1)
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

    private func toggleSelection() {
        if conference.isSelected {
            // Deselect the conference
            conference.updateSelection(with: .nonSelectionnee)
        } else {
            // Check for conflicts with other selected conferences
            let modelContext = conference.modelContext
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

    let theme = Theme(name: "Astronomie", color: .blue)
    let room = Room(name: "Amphithéâtre 1")
    let speaker = Speaker(firstName: "Jean", lastName: "Dupont")

    let calendar = Calendar.current
    let startTime = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 14, minute: 0))!
    let endTime = calendar.date(from: DateComponents(year: 2026, month: 11, day: 13, hour: 15, minute: 0))!

    let conference = Conference(
        title: "Les mystères de l'univers",
        summary: "Une conférence passionnante sur les mystères de l'univers.",
        date: startTime,
        startTime: startTime,
        endTime: endTime,
        room: room,
        speakers: [speaker],
        theme: theme
    )

    ConferenceRow(
        conference: conference,
        showChevron: true,
        showConflictIndicator: true,
        hasConflict: false
    )
    .modelContainer(container)
    .padding()
}
