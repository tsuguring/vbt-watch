//
//  TrainingSet.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/11.
//

import Foundation

struct TrainingSet: Identifiable {
    let id: UUID
    var reps: [TrainingRep]
    var averageVelocity: Double
    var maxVelocity: Double
    
    init(id: UUID = UUID(), reps: [TrainingRep], averageVelocity: Double, maxVelocity: Double) {
        self.id = id
        self.reps = reps
        self.averageVelocity = averageVelocity
        self.maxVelocity = maxVelocity
    }
    
    static let sampleSet: TrainingSet = TrainingSet(reps: [], averageVelocity: 0.00, maxVelocity: 0.00)
}
