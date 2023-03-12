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
    @State var canTransitionToSummary = false
    @State var currentSet = TrainingSet.sampleSet
    var currentRep: TrainingRep {
        get {
            if currentSet.reps.count != 0 {
                return currentSet.reps[currentSet.reps.count-1]
            }
            else {
                return TrainingRep.sampleRep
            }
        }
    }
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("\(data.sets.count)/\(trainingData.setCount)").font(.system(size: 20))
                    Text("セット")
                    Spacer()
                }
                HStack {
                    Text(String(currentSet.reps.count)).font(.system(size: 20))
                    Text("レップ")
                    Spacer()
                }
                HStack {
                    Text(String(trainingData.objective.velocity)).font(.system(size: 20))
                    VStack {
                        HStack {
                            Text("目標挙上速度")
                            Spacer()
                        }
                        HStack{
                            Text("m/s")
                            Spacer()
                        }
                    }.font(.system(size: 10))
                    Spacer()
                }
                HStack {
                    Text(String(roundVelocity(velocity: currentRep.velocity))).font(.system(size: 20))
                    VStack {
                        HStack {
                            Text("挙上速度")
                            Spacer()
                        }
                        HStack{
                            Text("m/s")
                            Spacer()
                        }
                    }.font(.system(size: 10))
                    Spacer()
                }
                HStack {
                    Text(String(currentRep.velocityLoss)).font(.system(size: 20))
                    VStack {
                        HStack {
                            Text("速度低下率")
                            Spacer()
                        }
                        HStack{
                            Text("%")
                            Spacer()
                        }
                    }.font(.system(size: 10))
                    Spacer()
                }
            }.padding()
            HStack {
                ButtonView(activityClassifier: activityClassifier, canTransitionToSummary: $canTransitionToSummary, label: "終了", color: Color.red)
                ButtonView(activityClassifier: activityClassifier, canTransitionToSummary: $canTransitionToSummary, label: activityClassifier.isStarted ? "一時停止" : "再開", color: Color.yellow)
            }
            if canTransitionToSummary {
                NavigationLink(destination: SummaryView(trainingData: $trainingData), isActive: $canTransitionToSummary) {
                    EmptyView()
                }
            }
        }.onChange(of: activityClassifier.velocityPerRep, perform: { newVelocity in
            storeRepData(velocity: newVelocity, velocityLoss: calculateVelocityLoss(velocity: newVelocity), targetError: calculateTargetError(velocity: newVelocity))
            finishIfNeeded(velocityLoss: calculateVelocityLoss(velocity: newVelocity))
        })
        .onAppear {
            activityClassifier.startManageMotionData()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    func calculateVelocityLoss(velocity: Double) -> Int {
        let maxVelocity = getMaxVelocity()
        if maxVelocity != 0 {
            return Int((roundVelocity(velocity: maxVelocity) - roundVelocity(velocity:velocity)) / roundVelocity(velocity: maxVelocity) * 100)
        }
        else { return 0 }
    }
    
    func calculateTargetError(velocity: Double) -> Double {
        return trainingData.objective.velocity - velocity
    }
    
    func getMaxVelocity() -> Double {
        let maxVelocityOrNil = currentSet.reps.max(by: { (a, b) -> Bool in
            return a.velocity < b.velocity
        })?.velocity
        
        guard let maxVelocity = maxVelocityOrNil else {
            return 0
        }
        return roundVelocity(velocity: maxVelocity)
    }
    
    func calculateAverageVelocity() -> Double {
        let velocityPerRepArray = currentSet.reps.map { $0.velocity }
        let sumVelocityPerSet = velocityPerRepArray.reduce(0, +)
        return roundVelocity(velocity: sumVelocityPerSet/Double(currentSet.reps.count))
    }
    
    func storeRepData(velocity: Double, velocityLoss: Int, targetError: Double) {
        let rep = TrainingRep(velocity: velocity, velocityLoss: velocityLoss, targetError: targetError)
        currentSet.reps.append(rep)
    }
    
    func storeSetData() {
        let set = TrainingSet(reps: currentSet.reps, averageVelocity: calculateAverageVelocity(), maxVelocity: getMaxVelocity())
        data.sets.append(set)
        initializeSetData()
    }
    
    func initializeSetData() {
        currentSet = TrainingSet.sampleSet
    }
    
    func finishIfNeeded(velocityLoss: Int) {
        if velocityLoss < trainingData.maxVelocityLoss {
            return
        }
        activityClassifier.stopManageMotionData()
        print(currentSet)
        storeSetData()
        print(data.sets)
        if data.sets.count < trainingData.setCount {
            // transition to RestView
        } else {
            trainingData.update(from: data)
            canTransitionToSummary = true
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(trainingData: .constant(TrainingData.sampleData[0]))
    }
}
