//
//  TrainingViewModel.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/05/28.
//

import Foundation

@MainActor
class TrainingViewModel: ObservableObject {
    @Published var trainingModel: TrainingModel
    
    init(model: TrainingModel) {
        self.trainingModel = model
    }
    
    var objective: ObjectiveModel {
        trainingModel.objective
    }
    
    var weight: Int {
        trainingModel.weight
    }
    
    var sets: [SetModel] {
        trainingModel.sets
    }
    
    var setCount: Int {
        trainingModel.setCount
    }
    
    var maxVelocityLoss: Int {
        trainingModel.maxVelocityLoss
    }
    
    var currentSetCount: Int {
        trainingModel.sets.count
    }
    
    var currentSet: SetModel {
        trainingModel.sets.last!
    }
    
    var currentRepCount: Int {
        currentSet.reps.count
    }
    
    var currentRep: RepModel {
        guard let currentRep = currentSet.reps.last else { return RepModel.sampleRep }
        return currentRep
    }
    
    func updateTrainingDetail(objectiveData: ObjectiveModel, weight: Int, setCount: Int, maxVelocityLoss: Int) {
        trainingModel.updateTrainingDetail(objectiveData: objectiveData, weight: weight, setCount: setCount, maxVelocityLoss: maxVelocityLoss)
    }
    
    func appendSetData(setData: SetModel) {
        trainingModel.appendSetData(setData: setData)
    }
    
    func appendRepData(repVelocity: Double) {
        let repData = RepModel(velocity: repVelocity, velocityLoss: calculateVelocityLoss(repVelocity: repVelocity), targetError: calculateTargetError(repVelocity: repVelocity))
        trainingModel.appendRepData(repData: repData)
        trainingModel.updateSetAveVelocity()
        trainingModel.updateSetMaxVelocity()
    }
    
    func calculateVelocityLoss(repVelocity: Double) -> Int {
        let maxVelocity = trainingModel.currentSetMaxVelocity()
        if maxVelocity == 0 { return 0 }
        let variation = roundVelocity(velocity: maxVelocity) - roundVelocity(velocity: repVelocity)
        if variation < 0 {
            return changePercent(denominator: repVelocity, molecule: variation)
        }
        else {
            return changePercent(denominator: maxVelocity, molecule: variation)
        }
    }
    
    func calculateTargetError(repVelocity: Double) -> Double {
        return roundVelocity(velocity: repVelocity-objective.velocity)
    }
}
