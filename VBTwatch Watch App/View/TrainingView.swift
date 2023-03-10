//
//  TrainingView.swift
//  VBTwatch Watch App
//
//  Created by Hiroki Kawamura on 2023/03/08.
//

import SwiftUI

struct TrainingView: View {
    @ObservedObject var activityClassifier = ActivityClassifier()
    @Binding var trainingData: TrainingData
    @State var data = TrainingData.Data()
    @State var currentSetCount: Int
    @State var currentRepCount: Int
    @State var sets: [TrainingData.Set] = []
    @State var reps: [TrainingData.Rep] = []
    @State var maxVelocity: Double = 0.0
    @State var velocity: Double = 0.0
    @State var velocityLoss: Int = 0
    @State var targetError: Double = 0.0
    @State var canTransition = false
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .trailing) {
                    Text("\(currentSetCount)/\(trainingData.setCount)")
                    Text("\(currentRepCount)")
                    Text("\(String(trainingData.objective.velocity))")
                    Text(" ")
                    Text("\(String(round(velocity * 100)/100))")
                    Text("\(velocityLoss)")
                }
                
                VStack(alignment: .leading) {
                    Text("セット")
                    Text("レップ")
                    Text("目標挙上速度")
                    Text("(m/s)")
                    Text("挙上速度(m/s)")
                    Text("速度低下率(%)")
                }
            }
            ButtonView()
            if canTransition {
                NavigationLink(destination: SummaryView(trainingData: $trainingData), isActive: $canTransition) {
                    EmptyView()
                }
            }
        }.onChange(of: ButtonView().activityClassifier.rep, perform: { newRep in
            storeRepData()
            currentRepCount += 1
            maxVelocity = max(maxVelocity, velocity)
            finishIfNeeded(velocityLoss: velocityLoss)
            print(trainingData)
        }).navigationBarBackButtonHidden(true)
    }
    
    func calculateVelocityLoss() -> Int {
        return Int(((trainingData.objective.velocity - velocity) / trainingData.objective.velocity) * 100)
    }
    
    func calculateTargetError() -> Double {
        return trainingData.objective.velocity - velocity
    }
    
    func calculateAverageVelocity() -> Double {
        var totalVelocity = 0.0
        for rep in reps {
            totalVelocity += rep.velocity
        }
        
        return totalVelocity / Double(reps.count)
    }
    
    func storeRepData() {
        let rep = TrainingData.Rep(velocity: velocity, velocityLoss: velocityLoss, targetError: targetError)
        reps.append(rep)
    }
    
    func storeSetData() {
        let set = TrainingData.Set(repCount: currentRepCount, reps: reps, averageVelocity: calculateAverageVelocity(), maxVelocity: maxVelocity)
        sets.append(set)
    }
    
    func initializeRepData() {
        reps = []
        currentRepCount = 0
        velocity = 0.0
        velocityLoss = 0
    }
    
    func finishIfNeeded(velocityLoss: Int) {
        if velocityLoss >= trainingData.maxVelocityLoss {
            if ButtonView().activityClassifier.isStarted {
                ButtonView().activityClassifier.stopManageMotionData()
            }
            storeSetData()
            data.weight = trainingData.weight
            data.setCount = trainingData.setCount
            data.sets = sets
            data.maxVelocityLoss = trainingData.maxVelocityLoss
            trainingData.update(from: data)
            initializeRepData()
            currentSetCount += 1
            if currentSetCount <= trainingData.setCount {
                // transition to 休憩View
            } else {
                canTransition = true
            }
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(trainingData: .constant(TrainingData.sampleData[0]), currentSetCount: 1, currentRepCount: 0, maxVelocity: 0.0)
    }
}
