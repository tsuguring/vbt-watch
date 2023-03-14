//
//  Objective.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/07.
//

import Foundation

struct Objective {
    var title: String
    var velocity: Double
    var perRM: Int
    var image: String
}

extension Objective {
    static let sampleData: [Objective] =
    [
        Objective(title: "筋肥大", velocity: 0.65, perRM: 70, image: "figure.strengthtraining.traditional"),
        Objective(title: "スピード筋力", velocity: 1.1, perRM: 40, image: "figure.core.training")
    ]
}
