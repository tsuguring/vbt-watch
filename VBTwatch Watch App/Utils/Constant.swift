//
//  Constant.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/11.
//

import Foundation

func roundVelocity(velocity: Double) -> Double {
    return round(velocity*100)/100
}

func changePercent(denominator: Double, molecule: Double) -> Int {
    return Int(roundVelocity(velocity: molecule) / denominator * 100)
}
