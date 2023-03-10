//
//  ButtonView.swift
//  VBTwatch Watch App
//
//  Created by Hiroki Kawamura on 2023/03/10.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var activityClassifier = ActivityClassifier()
    var body: some View {
        HStack {
            Button(action: {
                if activityClassifier.isStarted {
                    self.activityClassifier.stopManageMotionData()
                }
                
            }) {
                Text("\(Image(systemName: "xmark")) 終了").font(.footnote)
            }.colorMultiply(.red)
            Button(action: {
                activityClassifier.isStarted ? self.activityClassifier.stopManageMotionData() : self.activityClassifier.startManageMotionData()
            }) {
                activityClassifier.isStarted ? Text("\(Image(systemName: "pause.fill")) 一時停止").font(.footnote) : Text("\(Image(systemName: "play.fill")) 再開").font(.footnote)
            }.colorMultiply(.yellow)
        }
    }
}

