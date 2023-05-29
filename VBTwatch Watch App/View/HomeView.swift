//
//  HomeView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/07.
//

import SwiftUI

struct HomeView: View {
    @StateObject var trainingData: TrainingViewModel = TrainingViewModel(model: TrainingModel())
    let objectives: [ObjectiveModel] = ObjectiveModel.sampleData
    var body: some View {
        List {
            ForEach(objectives, id: \.title) { objective in
                NavigationLink(destination: EditView(trainingData: trainingData, objective: objective)) {
                    CardView(objective: objective)
                }
            }
        }
        .listStyle(CarouselListStyle())
        .navigationBarBackButtonHidden(true)
    }
}
