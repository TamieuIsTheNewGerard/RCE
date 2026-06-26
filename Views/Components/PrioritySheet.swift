//
//  PrioritySheet.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftUI

/// A sheet for selecting the priority of a conference.
struct PrioritySheet: View {
    @Bindable var conference: Conference
    @Binding var isPresented: Bool

    var body: some View {
        NavigationStack {
            List {
                Button {
                    conference.updateSelection(with: .haute)
                    isPresented = false
                } label: {
                    HStack {
                        Text(Constantes.Strings.highPriority)
                            .font(.headline)
                        Spacer()
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.red)
                    }
                }

                Button {
                    conference.updateSelection(with: .basse)
                    isPresented = false
                } label: {
                    HStack {
                        Text(Constantes.Strings.lowPriority)
                            .font(.headline)
                        Spacer()
                        Image(systemName: "arrow.down.circle.fill")
                            .foregroundColor(.orange)
                    }
                }
            }
            .navigationTitle(Constantes.Strings.choosePriorityTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(Constantes.Strings.conflictAlertCancel) {
                        isPresented = false
                    }
                }
            }
        }
    }
}

// Preview
#Preview {
    @State var isPresented = true

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

    return PrioritySheet(conference: conference, isPresented: $isPresented)
        .modelContainer(container)
}
