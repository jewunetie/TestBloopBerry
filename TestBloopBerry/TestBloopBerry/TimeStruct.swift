//
//  TimeStruct.swift
//  TestBloopBerry
//
//  Created by Jhonatan Ewunetie on 7/25/19.
//  Copyright © 2019 Jhonatan Ewunetie. All rights reserved.
//

import Foundation

struct Time {
    private var totalSeconds: Int = 0
    
    private mutating func isValidValue(_ newValue: Int) -> Int {
        if newValue < 0 {
            return 0
        } else {
            return newValue
        }
    }
    
    var seconds: Int {
        get {
            return totalSeconds - (minutes * 60)
        }
        set {
            totalSeconds = isValidValue(newValue)
        }
    }
    
    var minutes: Int {
        get {
            return totalSeconds / 60
        }
        
        set {
            totalSeconds = isValidValue(newValue * 60)
        }
    }
    
    init (_ minute: Int = 0, _ second: Int = 0) {
        totalSeconds = second >= 0 ? second : 0
        totalSeconds += minute >= 0 ? minute * 60 : 0
    }
    
    
    // PUBLIC FUNCTIONS:
    mutating func changeSeconds(_ by: Int = 0) {
        totalSeconds = isValidValue(totalSeconds + by)
    }
    
    func timeString() -> String {
        let minStr: String = String(minutes)
        let secStr: String = String(seconds)
        var timeStr: String = minStr + ":"
        if seconds / 10 == 0 {
            timeStr += "0"
        }
        timeStr += secStr
        return timeStr
    }
}
