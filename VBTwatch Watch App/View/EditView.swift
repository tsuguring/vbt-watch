//
//  EditView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/08.
//

import SwiftUI

struct EditView: View {
    @Binding var trainingData: TrainingModel
    let objective: ObjectiveModel
    @State var data = TrainingModel.Data()
    var body: some View {
        ScrollView {
            Form(label: "重量", data: $data.weight)
            Form(label: "セット数", data: $data.setCount)
            Form(label: "上限速度低下率", data: $data.maxVelocityLoss)
            NavigationLink(destination: Prepare(trainingData: $trainingData).onAppear {
                data.objective = objective
                trainingData.update(from: data)
            }) {
                Text("START")
            }.background(.pink)
                .cornerRadius(10)
                .padding(.top)
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(trainingData: .constant(TrainingModel.sampleData[0]), objective: ObjectiveModel.sampleData[0])
    }
}
