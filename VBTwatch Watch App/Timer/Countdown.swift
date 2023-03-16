//
//  Countdown.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/10.
//

import Foundation

class Countdown: ObservableObject {
    @Published var secondsRemaining: Int
    @Published var canTransition: Bool
    private var timer: Timer?
    init(secondsRemaining: Int, canTransition: Bool) {
        self.secondsRemaining = secondsRemaining
        self.canTransition = canTransition
    }
    
    func startCountdown() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in
            self.countdownTimer()
        }
    }
    
    func countdownTimer() {
        secondsRemaining -= 1
        if secondsRemaining == 0 {
            timer?.invalidate()
            timer = nil
            canTransition = true
        }
    }
}
