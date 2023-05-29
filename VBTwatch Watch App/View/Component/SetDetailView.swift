//
//  SetDetailView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/10.
//

import SwiftUI

struct SetDetailView: View {
    let index: Int
    let set: SetModel
    var body: some View {
        VStack {
            HStack {
                Text("\(index)セット目").font(. system(size: 14))
                Spacer()
            }.padding(.bottom, 2)
            HStack {
                Text("レップ数").font(.system(size: 12))
                Text(String(set.reps.count))
                Spacer() 
            }
            HStack {
                Text("最高挙上速度").font(.system(size: 12))
                Text(String(set.maxVelocity))
                Spacer()
            }
            HStack {
                Text("平均挙上速度").font(.system(size: 12))
                Text(String(set.averageVelocity))
                Spacer()
            }
        }.padding(.vertical)
    }
}

struct SetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SetDetailView(index: 1, set: TrainingModel.sampleData.sets[0])
    }
}
