//
//  VelocityMeasurement.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/05.
//

import Foundation
import CoreMotion

class VelocityMeasurement {
    static let G_ACCEL = 9.81
    var timeSpan = 0.0
    var velocity = 0.0
    private var lastAccel = 0.0
    
    init(timeSpan: Double) {
        self.timeSpan = timeSpan
    }
    
    func calculateVelocity(accel: Double) {
        // Acceleration is positive during the lift
        if accel >= 0 {
            velocity += (lastAccel + calculateMeterPerSecondSquared(accel: accel)) * timeSpan / 2
            lastAccel = calculateMeterPerSecondSquared(accel: accel)
        }
    }
    
    func calculateMeterPerSecondSquared(accel: Double) -> Double{
        return accel * VelocityMeasurement.G_ACCEL
    }
    
    func initializeVelocityData() {
        velocity = 0.0
        lastAccel = 0.0
    }
}
