//
//  SetModel.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/11.
//

import Foundation

struct SetModel {
    var reps: [RepModel]
    var averageVelocity: Double
    var maxVelocity: Double
    
    init(reps: [RepModel], averageVelocity: Double, maxVelocity: Double) {
        self.reps = reps
        self.averageVelocity = averageVelocity
        self.maxVelocity = maxVelocity
    }
    
    static let sampleSet: SetModel = SetModel(reps: [], averageVelocity: 0.00, maxVelocity: 0.00)
}
