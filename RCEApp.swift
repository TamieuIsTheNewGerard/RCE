//
//  RCEApp.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftUI
import SwiftData

@main
struct RCEApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: [Conference.self, Room.self, Speaker.self, Theme.self])
    }
}

/// The main tab view for the app, containing the three tabs: Planning, Conférences, and Mes conférences.
struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label(Constantes.Strings.planningTabTitle, systemImage: Constantes.Icons.planning)
                }

            ConferenceView()
                .tabItem {
                    Label(Constantes.Strings.conferencesTabTitle, systemImage: Constantes.Icons.conferences)
                }

            MesConferencesView()
                .tabItem {
                    Label(Constantes.Strings.myConferencesTabTitle, systemImage: Constantes.Icons.myConferences)
                }
        }
        .tint(.blue)
    }
}

// Preview
#Preview {
    MainTabView()
        .modelContainer(for: [Conference.self, Room.self, Speaker.self, Theme.self], inMemory: true)
}
