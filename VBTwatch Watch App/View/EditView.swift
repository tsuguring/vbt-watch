//
//  EditView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/08.
//

import SwiftUI

struct EditView: View {
    @State var trainingData = TrainingData.Data()
    var body: some View {
        ScrollView {
            Form(label: "重量", data: $trainingData.weight)
            Form(label: "セット数", data: $trainingData.setCount)
            Form(label: "上限速度低下率", data: $trainingData.maxVelocityLoss)
            Button(action: {
                
            }, label: {
                Text("START")
            }).background(.pink)
                .cornerRadius(10)
                .padding(.top)
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
