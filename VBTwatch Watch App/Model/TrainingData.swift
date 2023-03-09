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
    var setCount: Int
    var sets: [Set]
    var maxVelocityLoss: Int
    var date: Date
    
    init(id: UUID = UUID(), objective: Objective, weight: Int, setCount: Int, sets: [Set], maxVelocityLoss: Int, date: Date) {
        self.id = id
        self.objective = objective
        self.weight = weight
        self.setCount = setCount
        self.sets = sets
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
        var repCount: Int
        var reps: [Rep]
        var averageVelocity: Double
        var maxVelocity: Double
        
        init(id: UUID = UUID(), repCount: Int, reps: [Rep], averageVelocity: Double, maxVelocity: Double) {
            self.id = id
            self.repCount = repCount
            self.reps = reps
            self.averageVelocity = averageVelocity
            self.maxVelocity = maxVelocity
        }
        
        struct Data {
            var repCount: Int = 0
            var reps: [Rep] = []
            var averageVelocity: Double = 0.0
            var maxVelocity: Double = 0.0
        }
        
        var set: Data {
            Data(repCount: repCount, reps: reps, averageVelocity: averageVelocity, maxVelocity: maxVelocity)
        }
        
        mutating func update(from data: Data) {
            repCount = data.repCount
            reps = data.reps
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
        var setCount: Int = 3
        var sets: [Set] = []
        var maxVelocityLoss: Int = 20
        var date: Date = Date()
    }
    
    var data: Data {
        Data(objective: objective, weight: weight, setCount: setCount, sets: sets, maxVelocityLoss: maxVelocityLoss, date: date)
    }
    
    mutating func update(from data: Data) {
        objective = data.objective
        weight = data.weight
        setCount = data.setCount
        sets = data.sets
        maxVelocityLoss = data.maxVelocityLoss
        date = data.date
    }
}

extension TrainingData {
    static let sampleData: [TrainingData] =
    [
        TrainingData(objective: Objective(title: "筋肥大", velocity: 0.46, perRM: 80, image: "custom.figure.strengthtraining.traditional"), weight: 50, setCount: 2, sets: [Set(repCount: 5, reps: [], averageVelocity: 0.41, maxVelocity: 0.55), Set(repCount: 1, reps: [Rep(velocity: 0.34, velocityLoss: 20, targetError: 1.12)], averageVelocity: 0.34, maxVelocity: 0.45)], maxVelocityLoss: 30, date: Date()),
        TrainingData(objective: Objective(title: "スピード筋力", velocity: 0.94, perRM: 50, image: "custom.figure.core.training"), weight: 30, setCount: 3, sets: [], maxVelocityLoss: 25, date: Date())
    ]
}
