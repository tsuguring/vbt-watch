//
//  TrainingModelView.swift
//  VBTwatch Watch App
//
//  Created by Hiroki Kawamura on 2023/03/08.
//

import Foundation

struct TrainingModelView: Identifiable {
    let id: UUID
    var objective: ObjectiveModel
    var weight: Int
    var setCount: Int
    var sets: [SetModel]
    var maxVelocityLoss: Int
    var date: Date
    
    init(id: UUID = UUID(), objective: ObjectiveModel, weight: Int, setCount: Int, sets: [SetModel], maxVelocityLoss: Int, date: Date) {
        self.id = id
        self.objective = objective
        self.weight = weight
        self.setCount = setCount
        self.sets = sets
        self.maxVelocityLoss = maxVelocityLoss
        self.date = date
    }
}

extension TrainingModelView {
    struct Data {
        var objective: ObjectiveModel = ObjectiveModel.sampleData[0]
        var weight: Int = 40
        var setCount: Int = 3
        var sets: [SetModel] = []
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

extension TrainingModelView {
    static let sampleData: [TrainingModelView] =
    [
        TrainingModelView(objective: ObjectiveModel(title: "筋肥大", velocity: 0.46, perRM: 80, image: "figure.strengthtraining.traditional"), weight: 50, setCount: 2, sets: [SetModel(reps: [], averageVelocity: 0.41, maxVelocity: 0.55), SetModel(reps: [RepModel(velocity: 0.34, velocityLoss: 20, targetError: 1.12)], averageVelocity: 0.34, maxVelocity: 0.45)], maxVelocityLoss: 30, date: Date()),
        TrainingModelView(objective: ObjectiveModel(title: "スピード筋力", velocity: 0.94, perRM: 50, image: "figure.core.training"), weight: 30, setCount: 3, sets: [], maxVelocityLoss: 25, date: Date())
    ]
}
