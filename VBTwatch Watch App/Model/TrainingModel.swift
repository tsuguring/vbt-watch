//
//  TrainingModel.swift
//  VBTwatch Watch App
//
//  Created by Hiroki Kawamura on 2023/03/08.
//

import Foundation

struct TrainingModel {
    var objective: ObjectiveModel = ObjectiveModel.sampleData[0]
    var weight: Int = 40
    var setCount: Int = 3
    var sets: [SetModel] = [SetModel.sampleSet]
    var maxVelocityLoss: Int = 20
    var date: Date = Date()
    
    mutating func updateTrainingDetail(objectiveData: ObjectiveModel, weight: Int, setCount: Int, maxVelocityLoss: Int) {
        self.objective = objectiveData
        self.weight = weight
        self.setCount = setCount
        self.maxVelocityLoss = maxVelocityLoss
    }
    
    mutating func appendSetData(setData: SetModel) {
        self.sets.append(setData)
    }
    
    mutating func appendRepData(repData: RepModel) {
        if var lastSet = self.sets.last {
            lastSet.reps.append(repData)
            self.sets[sets.indices.last!] = lastSet
        }
    }
    
    mutating func updateSetMaxVelocity() {
        self.sets[sets.indices.last!].maxVelocity = currentSetMaxVelocity()
    }
    
    func currentSetMaxVelocity() -> Double {
        guard let lastSet = self.sets.last else { return 0.00 }
        let maxVelocity = lastSet.reps.max(by: { (a, b) -> Bool in
            return a.velocity < b.velocity
        })?.velocity
        guard let maxVelocity = maxVelocity else { return 0.00 }
        return roundVelocity(velocity: maxVelocity)
    }
    
    mutating func updateSetAveVelocity() {
        if var lastSet = self.sets.last {
            let velocityPerRepArray = lastSet.reps.map { $0.velocity }
            let sumVelocityPerSet = velocityPerRepArray.reduce(0, +)
            lastSet.averageVelocity = roundVelocity(velocity: sumVelocityPerSet/Double(lastSet.reps.count))
            self.sets[sets.indices.last!] = lastSet
        }
    }
}

extension TrainingModel {
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

extension TrainingModel {
    static let sampleData: TrainingModel =
    TrainingModel(objective: ObjectiveModel.sampleData[0], weight: 50, setCount: 2, sets: [], maxVelocityLoss: 30, date: Date())
}
