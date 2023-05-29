//
//  Prepare.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/09.
//

import SwiftUI

struct Prepare: View {
    let trainingData: TrainingViewModel
    @ObservedObject var countdown = Countdown(secondsRemaining: 5, canTransition: false)
    var body: some View {
        VStack {
            Image(trainingData.objective.image)
                .font(.system(size: 70))
                .foregroundColor(.pink)
            Text("準備").font(.system(size: 20))
            Text("\(countdown.secondsRemaining)秒後に開始").font(.system(size: 15))
            if countdown.canTransition {
                NavigationLink(destination: TrainingView(trainingData: trainingData), isActive: $countdown.canTransition) {
                    EmptyView()
                }
            }
        }
        .onAppear {
            countdown.startCountdown()
        }
        .navigationBarBackButtonHidden(true)
    }
}

//struct Prepare_Previews: PreviewProvider {
//    static var previews: some View {
//        Prepare(trainingData: .constant(TrainingModelView.sampleData[0]))
//    }
//}
