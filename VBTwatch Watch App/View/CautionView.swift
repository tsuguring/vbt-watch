//
//  CautionView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/10.
//

import SwiftUI

struct CautionView: View {
    @Binding var trainingData: TrainingData
    let targetError = 0.17 //ここはrepの挙上速度-目標速度にする
    var body: some View {
        VStack {
            Image("exclamationmark.triangle.fill")
                .font(.system(size: 70))
                .foregroundColor(.yellow)
            Text("挙上速度と目標速度との差が\(targetError)と大きいです。").font(.system(size: 13))
            Text("重量を変更しますか？").font(.system(size: 13)).padding(.top)
            //↓Buttonの実装
        }
    }
}

struct CautionView_Previews: PreviewProvider {
    static var previews: some View {
        CautionView(trainingData: .constant(TrainingData.sampleData[0]))
    }
}
