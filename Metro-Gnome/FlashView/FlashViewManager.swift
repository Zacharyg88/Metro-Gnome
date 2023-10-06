//
//  FlashViewManager.swift
//  Metro-Gnome
//
//  Created by Zach Eidenberger on 10/4/23.
//

import Foundation
import SwiftUI

#if canImport(WatchKit)
import WatchKit
#endif


class FlashViewManager: ObservableObject {
    @Published var shouldFlash: Bool = false
    @Published var currentBPM: Double = 0.0 {
        didSet {
            self.timer.invalidate()
            let interval = 60 / currentBPM
            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(interval), target: self, selector: #selector(self.timerFlash) , userInfo: nil, repeats: true)
            
        }
    }
    @Published var lastTapDate: Date?
    @Published var staticColor = Color("E1")
    @Published var flashColor = Color(.white)
    var timer: Timer = Timer()
    
    
    @objc func timerFlash() {
        flashHandler(didRecieveTap: false)
    }
    
    func flashHandler(didRecieveTap: Bool) {
        if didRecieveTap {
            guard let lastDate = lastTapDate else {
                self.lastTapDate = Date()
                return
            }
            let distance = lastDate.distance(to: Date())
            currentBPM = 60 / distance
            lastTapDate = Date()
        }
        
        self.shouldFlash = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.09, execute: {
            self.shouldFlash = false
        })
        
        #if os(watchOS)
        //WKinterfaceDevice.current.play(.click)
        #endif
        
    }
    
    func getColor() -> Color {
        if shouldFlash {
            return flashColor
        }else {
            return staticColor
        }
    }
}
