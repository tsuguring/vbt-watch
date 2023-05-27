//
//  VBTwatchApp.swift
//  VBTwatch
//
//  Created by Ryo Yoshitsugu on R 5/03/04.
//

import SwiftUI

@main
struct VBTwatchApp: App {
    @StateObject private var persistenceController = PersistenceController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
