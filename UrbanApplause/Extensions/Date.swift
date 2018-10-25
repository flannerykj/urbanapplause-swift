//
//  Date.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-25.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    func getTimeSince() -> String {
        let date = self
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        if day > 2 {
            return "\(day) days ago"
        }
        if hour >= 1 {
            if (hour == 1) && (minutes < 30) {
                return "1 hour ago"
            }
            if minutes >= 30 {
                return "\(hour + 1)s ago"
            }
            return "\(hour)s ago"
        }
        if minutes >= 1 {
            if minutes == 1 {
                return "1 minute ago"
            }
            return "\(minutes)s ago"
        }
        return "now"
    }
}


