//
//  RestView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/14.
//

import SwiftUI

struct RestView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var countdown = Countdown(secondsRemaining: 30, canTransition: false)
    var body: some View {
        VStack {
            Image("figure.rower")
                .font(.system(size: 70))
                .foregroundColor(.pink)
            Text("休憩").font(.system(size: 20))
            Text("\(countdown.secondsRemaining)秒後に開始").font(.system(size: 15))
            if countdown.canTransition {
                let _ = dismiss()
            }
        }.onAppear {
            countdown.startCountdown()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RestView_Previews: PreviewProvider {
    static var previews: some View {
        RestView()
    }
}
