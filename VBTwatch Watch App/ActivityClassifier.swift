//
//  ActivityClassifier.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/04.
//

import Foundation
import CoreML
import CoreMotion

class ActivityClassifier: ObservableObject {
    @Published var isStarted = false
    @Published var rep = 0
    
    struct ModelConstants {
        static let predictionWindowSize = 100
        static let sensorsUpdateInterval = 1.0 / 200.0
        static let stateInLength = 400
    }
    
    static let configuration = MLModelConfiguration()
    private let motionClassificationModel = try! BenchPressClassifier(configuration: configuration)
    
    private let acceleration_x = try! MLMultiArray(
        shape: [ModelConstants.predictionWindowSize] as [NSNumber],
        dataType: MLMultiArrayDataType.double)
    private let acceleration_y = try! MLMultiArray(
        shape: [ModelConstants.predictionWindowSize] as [NSNumber],
        dataType: MLMultiArrayDataType.double)
    private let acceleration_z = try! MLMultiArray(
        shape: [ModelConstants.predictionWindowSize] as [NSNumber],
        dataType: MLMultiArrayDataType.double)
    private var stateOutput = try! MLMultiArray(
        shape:[ModelConstants.stateInLength as NSNumber],
        dataType: MLMultiArrayDataType.double)
    
    private var predictionWindowIndex = 0
    private var lastLavel = "Neutral"
    private let motionManager = CMMotionManager()
    
    func startManageMotionData() {
        ExtendedRunTime.shared.start()
        
        self.isStarted = true
        guard motionManager.isDeviceMotionAvailable else { return }
        
        // initialize stateInLength
        for index in 0..<ModelConstants.stateInLength {
            stateOutput[[index] as [NSNumber]] = 0 as NSNumber
        }
        
        motionManager.deviceMotionUpdateInterval = TimeInterval(ModelConstants.sensorsUpdateInterval)
        motionManager.startDeviceMotionUpdates(to: .main) { deviceMotion, error in
            guard let deviceMotionData = deviceMotion else { return }
            self.addDiviceMotionSampleToDataArray(motionSample: deviceMotionData)
        }
    }
    
    func stopManageMotionData() {
        
        ExtendedRunTime.shared.stop()
        
        self.isStarted = false
        motionManager.stopDeviceMotionUpdates()
    }
    
    private func addDiviceMotionSampleToDataArray(motionSample: CMDeviceMotion) {
        acceleration_x[[predictionWindowIndex] as [NSNumber]] = motionSample.userAcceleration.x as NSNumber
        acceleration_y[[predictionWindowIndex] as [NSNumber]] = motionSample.userAcceleration.y as NSNumber
        acceleration_z[[predictionWindowIndex] as [NSNumber]] = motionSample.userAcceleration.z as NSNumber
        
        predictionWindowIndex += 1
        if predictionWindowIndex == ModelConstants.predictionWindowSize
        {
            predictMotion()
            predictionWindowIndex = 0
        }
    }
    
    private func predictMotion() {
        let modelPrediction = try! motionClassificationModel.prediction(
            acceleration_x: acceleration_x,
            acceleration_y: acceleration_y,
            acceleration_z: acceleration_z,
            stateIn: stateOutput)
        
        print(modelPrediction.label, modelPrediction.labelProbability)
        getRepInfomation(prediction: modelPrediction)
    }
    
    private func getRepInfomation(prediction: BenchPressClassifierOutput) {
        if prediction.label != "BenchPress" && lastLavel == "BenchPress" {
            rep += 1
        }
        lastLavel = prediction.label
    }
}

