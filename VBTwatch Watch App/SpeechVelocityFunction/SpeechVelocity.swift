//
//  SpeechVelocity.swift
//  VBTwatch Watch App
//
//  Created by Hiroki Kawamura on 2023/03/13.
//

import Foundation
import AVFoundation

func speechVelocity(velocity: Double) -> AVSpeechUtterance {
    let text = "\(velocity)メートル毎秒です"
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
    utterance.rate = 0.55
    return utterance
}
