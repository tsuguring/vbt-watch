//
//  RepModel.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/11.
//

import Foundation

struct RepModel {
    var velocity: Double
    var velocityLoss: Int
    var targetError: Double
    
    init(velocity: Double, velocityLoss: Int, targetError: Double) {
        self.velocity = velocity
        self.velocityLoss = velocityLoss
        self.targetError = targetError
    }
    
    static let sampleRep: RepModel = RepModel(velocity: 0.00, velocityLoss: 0, targetError: 0.00)
}
