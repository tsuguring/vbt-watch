//
//  Prepare.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/09.
//

import SwiftUI

struct Prepare: View {
    @Binding var trainingData: TrainingData
    @ObservedObject var countdown = Countdown(secondsRemaining: 5)
    var body: some View {
        VStack {
            Image(trainingData.objective.image)
                .font(.system(size: 70))
                .foregroundColor(.pink)
            Text("準備").font(.system(size: 20))
            Text("\(countdown.secondsRemaining)秒後に始まります").font(.system(size: 11))
        }.onAppear {
            countdown.startCountdown()
        }
    }
}

struct Prepare_Previews: PreviewProvider {
    static var previews: some View {
        Prepare(trainingData: .constant(TrainingData.sampleData[0]))
    }
}
