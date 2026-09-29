//
//  Task_TrackerApp.swift
//  Task Tracker
//
//  Created by MARYANN KIMANI on 28/09/2026.
//

import SwiftUI
import SwiftData

@main
struct Task_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
 
