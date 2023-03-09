//
//  TrainingData.swift
//  VBTwatch Watch App
//
//  Created by Hiroki Kawamura on 2023/03/08.
//

import Foundation

struct TrainingData: Identifiable {
    let id: UUID
    var objective: Objective
    var weight: Int
    var numSet: Int
    var set: [Set]
    var maxVelocityLoss: Int
    var date: Date
    
    init(id: UUID = UUID(), objective: Objective, weight: Int, numSet: Int, set: [Set], maxVelocityLoss: Int, date: Date) {
        self.id = id
        self.objective = objective
        self.weight = weight
        self.numSet = numSet
        self.set = set
        self.maxVelocityLoss = maxVelocityLoss
        self.date = date
    }
}

extension TrainingData {
    struct Objective {
        let id: UUID
        var title: String
        var velocity: Double
        var perRM: Int
        var image: String
        
        init(id: UUID = UUID(), title: String, velocity: Double, perRM: Int, image: String) {
            self.id = id
            self.title = title
            self.velocity = velocity
            self.perRM = perRM
            self.image = image
        }
    }

    struct Set {
        let id: UUID
        var numRep: Int
        var rep: [Rep]
        var averageVelocity: Double
        var maxVelocity: Double
        
        init(id: UUID = UUID(), numRep: Int, rep: [Rep], averageVelocity: Double, maxVelocity: Double) {
            self.id = id
            self.numRep = numRep
            self.rep = rep
            self.averageVelocity = averageVelocity
            self.maxVelocity = maxVelocity
        }
        
        struct Data {
            var numRep: Int = 0
            var rep: [Rep] = []
            var averageVelocity: Double = 0.0
            var maxVelocity: Double = 0.0
        }
        
        var set: Data {
            Data(numRep: numRep, rep: rep, averageVelocity: averageVelocity, maxVelocity: maxVelocity)
        }
        
        mutating func update(from data: Data) {
            numRep = data.numRep
            rep = data.rep
            averageVelocity = data.averageVelocity
            maxVelocity = data.maxVelocity
        }
    }

    struct Rep {
        let id: UUID
        var velocity: Double
        var velocityLoss: Int
        var targetError: Double
        
        init(id: UUID = UUID(), velocity: Double, velocityLoss: Int, targetError: Double) {
            self.id = id
            self.velocity = velocity
            self.velocityLoss = velocityLoss
            self.targetError = targetError
        }
        
        struct Data {
            var velocity: Double = 0.0
            var velocityLoss: Int = 0
            var targetError: Double = 0.0
        }
        
        var rep: Data {
            Data(velocity: velocity, velocityLoss: velocityLoss, targetError: targetError)
        }
        
        mutating func update(from data: Data) {
            velocity = data.velocity
            velocityLoss = data.velocityLoss
            targetError = data.targetError
        }
    }
    
    struct Data {
        var objective: Objective = Objective(title: "", velocity: 0.5, perRM: 50, image: "")
        var weight: Int = 40
        var numSet: Int = 3
        var set: [Set] = []
        var maxVelocityLoss: Int = 0
        var date: Date = Date()
    }
    
    var data: Data {
        Data(objective: objective, weight: weight, numSet: numSet, set: set, maxVelocityLoss: maxVelocityLoss, date: date)
    }
    
    mutating func update(from data: Data) {
        objective = data.objective
        weight = data.weight
        numSet = data.numSet
        set = data.set
        maxVelocityLoss = data.maxVelocityLoss
        date = data.date
    }
}

extension TrainingData {
    static let sampleData: [TrainingData] =
    [
        TrainingData(objective: Objective(title: "筋肥大", velocity: 0.46, perRM: 80, image: "figure.strengthtraining.traditional"), weight: 50, numSet: 2, set: [Set(numRep: 5, rep: [], averageVelocity: 0.41, maxVelocity: 0.55), Set(numRep: 1, rep: [Rep(velocity: 0.34, velocityLoss: 20, targetError: 1.12)], averageVelocity: 0.34, maxVelocity: 0.45)], maxVelocityLoss: 30, date: Date()),
        TrainingData(objective: Objective(title: "スピード筋力", velocity: 0.94, perRM: 50, image: "figure.core.training"), weight: 30, numSet: 3, set: [], maxVelocityLoss: 25, date: Date())
    ]
}
