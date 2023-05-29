//
//  TrainingView.swift
//  VBTwatch Watch App
//
//  Created by Hiroki Kawamura on 2023/03/08.
//

import SwiftUI

struct TrainingView: View {
    @ObservedObject var activityClassifier = ActivityClassifier()
    @ObservedObject var trainingData: TrainingViewModel
    @State var canTransitionToSummary = false
    @State var canTransitionToHome = false
    @State var canTransitionToRest = false
    @State var showingAlert = false
    @State var isFirst = true
    @State var isBackFromAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("\(trainingData.currentSetCount)/\(trainingData.setCount)").font(.system(size: 20))
                    Text("セット")
                    Spacer()
                }
                HStack {
                    Text(String(trainingData.currentRepCount)).font(.system(size: 20))
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
                    Text(String(roundVelocity(velocity: trainingData.currentRep.velocity))).font(.system(size: 20))
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
                    Text(String(trainingData.currentRep.velocityLoss)).font(.system(size: 20))
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
                ButtonView(activityClassifier: activityClassifier, canTransition: $canTransitionToSummary, label: "終了", color: Color.red)
                ButtonView(activityClassifier: activityClassifier, canTransition: $canTransitionToSummary, label: activityClassifier.isStarted ? "一時停止" : "再開", color: Color.yellow)
            }
            if canTransitionToSummary {
                NavigationLink(destination: SummaryView(trainingData: trainingData), isActive: $canTransitionToSummary) {
                    EmptyView()
                }
            }
            if canTransitionToHome {
                NavigationLink(destination: HomeView(), isActive: $canTransitionToHome) {
                    EmptyView()
                }
            }
            if canTransitionToRest {
                NavigationLink(destination: RestView(), isActive: $canTransitionToRest) {
                    EmptyView()
                }
            }
        }.onChange(of: activityClassifier.velocityPerRep, perform: { newVelocity in
            if newVelocity == 0.0 { return }
            if isFirst {
                isFirst = false
                alertIfNeeded(targetError: trainingData.calculateTargetError(repVelocity: newVelocity))
            }
            trainingData.appendRepData(repVelocity: newVelocity)
            speechText(text: String(roundVelocity(velocity: newVelocity)))
            finishIfNeeded(velocityLoss: trainingData.currentRep.velocityLoss)
        })
        .alert(
            "目的や重量を変更しますか？",
            isPresented: $showingAlert
        ) {
            Button("はい") {
                canTransitionToHome = true
            }
            Button("いいえ") {
                isBackFromAlert = true
            }
        } message: {
            Text("挙上速度と目標速度の差が\(String(trainingData.currentRep.targetError))と大きいです。")
        }
        .onAppear {
            activityClassifier.startManageMotionData()
            if !isBackFromAlert {
                WKInterfaceDevice.current().play(.notification)
                speechText(text: "\(trainingData.currentSetCount)セットめ開始")
            }
            isBackFromAlert = false
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func alertIfNeeded(targetError: Double) {
        let MAX_PERMISSIBLE_ERROR = 0.15
        if abs(targetError) >  MAX_PERMISSIBLE_ERROR {
            self.activityClassifier.stopManageMotionData()
            WKInterfaceDevice.current().play(.notification)
            showingAlert = true
        }
    }
    
    func finishIfNeeded(velocityLoss: Int) {
        if velocityLoss < trainingData.maxVelocityLoss { return }
        activityClassifier.stopManageMotionData()
        WKInterfaceDevice.current().play(.notification)
        speechText(text: "\(trainingData.currentSetCount)セットめ終了")
        if trainingData.currentSetCount < trainingData.setCount {
            trainingData.appendSetData(setData: SetModel.sampleSet)
            canTransitionToRest = true
        } else {
            canTransitionToSummary = true
        }
    }
}

