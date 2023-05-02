//
//  Test.swift
//  VBTwatch Watch App
//
//  Created by Hiroki Kawamura on 2023/03/13.
//

import Foundation
import AVFoundation

let synthesizer = AVSpeechSynthesizer()

func speechText(text: String) {
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
    utterance.rate = 0.55
    synthesizer.speak(utterance)
}
