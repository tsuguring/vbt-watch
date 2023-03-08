//
//  ExplanationView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/08.
//

import SwiftUI

struct VBTExplanation: View {
    let objective: Objective
    var body: some View {
        ScrollView {
            VStack {
                Text("\(objective.title)トレーニング").padding(.bottom)
                Text("\(objective.title)に適した重量はおよそ\(objective.weight)1RM(1回持ち上げることが限界の重さの\(objective.weight))である。1RMの何%であるかは挙上速度によって推測でき、あなたが最大の速度で上げた時の速度が\(String(objective.velocity))m/sである時の重量は\(objective.weight)1RMである。").font(.caption)
                Text("上限速度低下率").padding(.vertical)
                Text("1セットにおいて最も挙上速度が大きいRepの速度から、設定した上限速度低下率以上の割合で速度が低下するとセットを終了する。").font(.caption)
            }.padding()
        }
    }
}

struct VBTExplanation_Previews: PreviewProvider {
    static var previews: some View {
        VBTExplanation(objective: Objective.sampleData[0])
    }
}
