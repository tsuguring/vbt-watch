//
//  HomeView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/07.
//

import SwiftUI

struct HomeView: View {
    let objectives: [Objective]
    var body: some View {
        List {
            ForEach(objectives, id: \.title) { objective in
                NavigationLink(destination: EditView()) {
                    CardView(objective: objective)
                }
            }
        }.listStyle(CarouselListStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(objectives: Objective.sampleData)
    }
}
