//
//  ContentView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activityClassifier = ActivityClassifier()
    var body: some View {
        VStack {
            if activityClassifier.isStarted {
                Text("\(activityClassifier.rep)")
            }
            else {
                Text("Try to push the barbell !!")
                    .font(.title3)
                    .foregroundColor(.orange)
                    .bold()
            }
            Button(action: {
                activityClassifier.isStarted ? self.activityClassifier.stopManageMotionData() : self.activityClassifier.startManageMotionData()
            }) {
                activityClassifier.isStarted ? Text("STOP") : Text("START")
            };
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
