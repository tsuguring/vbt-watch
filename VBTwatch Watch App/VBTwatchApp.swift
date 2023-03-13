//
//  VBTwatchApp.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/04.
//

import SwiftUI

@main
struct VBTwatch_Watch_AppApp: App {
    @State var trainingData = TrainingData.sampleData[0]
    let objectives = Objective.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView(trainingData: $trainingData, objectives: objectives)
//                TrainingView(trainingData: $trainingData, currentSetCount: 1, currentRepCount: 0, maxVelocity: 0.0)
            }
        }
    }
}
