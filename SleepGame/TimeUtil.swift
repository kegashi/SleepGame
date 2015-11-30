//
//  TimeUtil.swift
//  Mimamori
//
//  Created by Yuki Furukawa on 2015/06/23.
//  Copyright (c) 2015年 Kazuki Egashira. All rights reserved.
//

import Foundation

public class TimeUtil {
    
    public class func getNSDate(time: String) -> NSDate {
        let formatter = NSDateFormatter()
        formatter.timeZone = NSTimeZone(name: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let date = formatter.dateFromString(time)!
        return date
    }
    
}

extension NSDate {
    var year: Int {
        let cal = NSCalendar.currentCalendar()
        return cal.component(NSCalendarUnit.Year, fromDate: self)
    }
    
    var month: Int {
        let cal = NSCalendar.currentCalendar()
        return cal.component(NSCalendarUnit.Month, fromDate: self)
    }
    
    var day: Int {
        let cal = NSCalendar.currentCalendar()
        return cal.component(NSCalendarUnit.Day, fromDate: self)
    }
    
    var hour: Int {
        let cal = NSCalendar.currentCalendar()
        return cal.component(NSCalendarUnit.Hour, fromDate: self)
    }
    
    var minute: Int {
        let cal = NSCalendar.currentCalendar()
        return cal.component(NSCalendarUnit.Minute, fromDate: self)
    }
    
    var second: Int {
        let cal = NSCalendar.currentCalendar()
        return cal.component(NSCalendarUnit.Second, fromDate: self)
    }
}