//
//  HomeView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/07.
//

import SwiftUI

struct HomeView: View {
    @State var trainingData: TrainingData = TrainingData.sampleData[0]
    @State var data = TrainingData.Data()
    let objectives: [Objective] = Objective.sampleData
    var body: some View {
        List {
            ForEach(objectives, id: \.title) { objective in
                NavigationLink(destination: EditView(trainingData: $trainingData, objective: objective)) {
                    CardView(objective: objective)
                }
            }
        }
        .listStyle(CarouselListStyle())
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
