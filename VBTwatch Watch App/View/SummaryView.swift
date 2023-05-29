//
//  SummaryView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/10.
//

import SwiftUI

struct SummaryView: View {
    @ObservedObject var trainingData: TrainingViewModel
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(trainingData.objective.image)
                        .font(.system(size: 50))
                        .foregroundColor(.pink)
                    Spacer()
                }
                Text("\(trainingData.objective.title)").font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("重量 \(trainingData.weight) kg").font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                VStack {
                    HStack {
                        Text("セット数").font(.system(size: 14))
                        Spacer()
                    }
                    HStack {
                        Text("\(trainingData.sets.count)/\(trainingData.setCount)").font(.system(size: 17))
                        Spacer()
                    }
                }.padding(.vertical)
                Divider()
                ForEach(Array(trainingData.sets.enumerated()), id: \.offset) { setIndex, set in
                    SetDetailView(index: setIndex+1, set: set)
                    Divider()
                }
                NavigationLink(destination: HomeView()) {
                    Text("完了")
                }.background(.pink)
                    .cornerRadius(10)
                    .padding(.top)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

//struct SummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SummaryView(trainingData: .constant(TrainingModel.sampleData))
//    }
//}
