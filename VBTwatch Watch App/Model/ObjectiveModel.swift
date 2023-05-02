//
//  ObjectiveModel.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/07.
//

import Foundation

struct ObjectiveModel {
    var title: String
    var velocity: Double
    var perRM: Int
    var image: String
}

extension ObjectiveModel {
    static let sampleData: [ObjectiveModel] =
    [
        ObjectiveModel(title: "筋肥大", velocity: 0.65, perRM: 70, image: "figure.strengthtraining.traditional"),
        ObjectiveModel(title: "スピード筋力", velocity: 1.1, perRM: 40, image: "figure.core.training")
    ]
}
