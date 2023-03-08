//
//  TrainingView.swift
//  VBTwatch Watch App
//
//  Created by 河村宇記 on 2023/03/08.
//

import SwiftUI

struct TrainingView: View {
    @ObservedObject var activityClassifier = ActivityClassifier()
    let objective: Objective
    var set: Int
    var targetVelocity: Int
    var velocityLoss: Int
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .trailing) {
                    Text("1/\(set)")
                    Text("\(activityClassifier.rep)")
                    Text("\(String(objective.velocity))")
                    Text("\(String(activityClassifier.velocityPerRep))")
                    Text("\(velocityLoss)")
                }
                
                VStack(alignment: .leading) {
                    Text("セット")
                    Text("レップ")
                    Text("目標挙上速度(m/s)")
                    Text("挙上速度(m/s)")
                    Text("速度低下率(%)")
                    
                }
            }
            Spacer()
            HStack {
                Button(action: {
                    if activityClassifier.isStarted {
                        self.activityClassifier.stopManageMotionData()
                    }
                    // transition to SummaryView
                }) {
                    Text("\(Image(systemName: "xmark")) 終了").font(.caption2)
                }.colorMultiply(.red)
                Button(action: {
                    activityClassifier.isStarted ? self.activityClassifier.stopManageMotionData() : self.activityClassifier.startManageMotionData()
                }) {
                    activityClassifier.isStarted ? Text("\(Image(systemName: "pause.fill")) 一時停止").font(.caption2) : Text("\(Image(systemName: "play.fill")) 再開").font(.caption2)
                }.colorMultiply(.yellow)
            }
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(objective: Objective.sampleData[0], set: 2, targetVelocity: 2, velocityLoss: 2)
    }
}
