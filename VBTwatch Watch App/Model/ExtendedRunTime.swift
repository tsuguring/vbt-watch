//
//  ExtendedRunTime.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/04.
//

import SwiftUI

class ExtendedRunTime: NSObject, WKExtendedRuntimeSessionDelegate {
    
    static let shared = ExtendedRunTime()
    
    var session: WKExtendedRuntimeSession
    
    override init() {
        
        // Create the session object.
        session = WKExtendedRuntimeSession()
        
        super.init()

        // Assign the delegate.
        session.delegate = self
    }
    
    func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
    }
    
    func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
    }
    
    func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
    }
    
    func start() {
        session = WKExtendedRuntimeSession()
        session.delegate = self
        session.start()
    }
    
    func stop() {
        session.invalidate()
    }
}
