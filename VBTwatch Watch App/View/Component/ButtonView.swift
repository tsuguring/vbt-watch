//
//  ButtonView.swift
//  VBTwatch Watch App
//
//  Created by Hiroki Kawamura on 2023/03/10.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var activityClassifier : ActivityClassifier
    @Binding var canTransitionToSummary: Bool
    let label: String
    let color: Color
    var body: some View {
        HStack {
            Button(action: {
                switch label {
                case "終了":
                    do { 
                        activityClassifier.stopManageMotionData()
                        canTransitionToSummary.toggle()
                    }
                case "中止", "一時停止":
                    do {
                        activityClassifier.stopManageMotionData()
                    }
                case "再開":
                    do {
                        activityClassifier.startManageMotionData()
                    }
                default:
                    break
                }
            }) {
                HStack {
                    Image(systemName: getImage(label: label)).font(.system(size: 11))
                    Text(label).font(.system(size: 11))
                }
            }.colorMultiply(color)
        }
    }
}

func getImage(label: String) -> String {
    switch label {
    case "終了", "中止":
        return "xmark"
    case "一時停止":
        return "pause.fill"
    case "再開":
        return "play.fill"
    default:
        return ""
    }
}
