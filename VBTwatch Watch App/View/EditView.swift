//
//  EditView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/08.
//

import SwiftUI

struct EditView: View {
    let trainingData: TrainingViewModel
    @State var weight: Int = 40
    @State var setCount: Int = 3
    @State var maxVelocityLoss: Int = 20
    let objective: ObjectiveModel
    var body: some View {
        ScrollView {
            Form(label: "重量", data: $weight)
            Form(label: "セット数", data: $setCount)
            Form(label: "上限速度低下率", data: $maxVelocityLoss)
            NavigationLink(destination: Prepare(trainingData: trainingData)) {
                Text("START")
            }.simultaneousGesture(TapGesture().onEnded {
                trainingData.updateTrainingDetail(objectiveData: objective, weight: weight, setCount: setCount, maxVelocityLoss: maxVelocityLoss)
            }).background(.pink)
                .cornerRadius(10)
                .padding(.top)
        }
    }
}
