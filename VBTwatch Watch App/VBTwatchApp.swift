//
//  VBTwatchApp.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/04.
//

import SwiftUI

@main
struct VBTwatch_Watch_AppApp: App {
    let objectives = Objective.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView(objectives: objectives)
            }
        }
    }
}
