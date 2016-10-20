//
//  Date.swift
//  Swiftly
//
//  Created by Khoi Lai on 08/10/2016.
//  Copyright © 2016 Khoi Lai. All rights reserved.
//

import Foundation

public extension Date{

    fileprivate var components: DateComponents{
        return calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond, .weekday, .weekdayOrdinal, .quarter, .weekOfMonth, .weekOfYear], from: self)
    }

    fileprivate var calendar: Calendar {
        return Calendar.current
    }


    /// An era or count of eras.
    /// - note: This value is for Calendar.current
    var era: Int{
        return components.era!
    }


    /// A year or count of years.
    /// - note: This value is for Calendar.current
    var year: Int {
        return components.year!
    }


    /// A month or count of months.
    /// - note: This value is for Calendar.current
    var month: Int{
        return components.month!
    }


    /// A day or count of days.
    /// - note: This value is for Calendar.current
    var day: Int{
        return components.day!
    }


    /// An hour or count of hours.
    /// - note: This value is for Calendar.current
    var hour: Int{
        return components.hour!
    }


    /// A minute or count of minutes.
    /// - note: This value is for Calendar.current
    var minute: Int{
        return components.minute!
    }


    /// A second or count of seconds.
    /// - note: This value is for Calendar.current
    var second: Int{
        return components.second!
    }


    /// A nanosecond or count of nanoseconds.
    /// - note: This value is for Calendar.current
    var nanosecond: Int{
        return components.nanosecond!
    }


    /// A weekday or count of weekdays.
    /// - note: This value is for Calendar.current
    var weekday: Int{
        return components.weekday!
    }


    /// A weekday ordinal or count of weekday ordinals.
    /// - note: This value is for Calendar.current
    var weekdayOrdinal: Int{
        return components.weekdayOrdinal!
    }


    /// A quarter or count of quarters.
    /// - note: This value is for Calendar.current
    var quarter: Int{
        return components.quarter!
    }


    /// A week of the month or a count of weeks of the month.
    /// - note: This value is for Calendar.current
    var weekOfMonth: Int{
        return components.weekOfMonth!
    }


    /// A week of the year or count of the weeks of the year.
    /// - note: This value is for Calendar.current
    var weekOfYear: Int{
        return components.weekOfYear!
    }


    public init?(from string: String, format: String){
        let df = DateFormatter()
        df.dateFormat = format
        guard let date = df.date(from: string) else { return nil }
        self = date
    }
    
    /// Return the string representation for a date.
    ///
    /// - parameter dateStyle: A DateFormatter.Style for the date. default to `.medium`.
    /// - parameter timeStyle: A DateFormatter.Style for the time. default to `.medium`.
    /// - parameter locale:    Locale of the string. default to the current locale.
    ///
    /// - returns: The date string.
    func toString(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium, locale: Locale = Locale.current) -> String{
        let df = DateFormatter()
        df.dateStyle = dateStyle
        df.timeStyle = timeStyle
        df.locale = locale
        return df.string(from: self)
    }


    /// Return the string representation for a date using a date format.
    ///
    /// - parameter format: The date format string.
    /// - parameter locale: Locale of the string. default to `.locale`
    ///
    /// - returns: The date string.
    func toString(format: String, locale: Locale = Locale.current) -> String{
        let df = DateFormatter()
        df.dateFormat = format
        df.locale = locale
        return df.string(from: self)
    }


    /// Check if self is before input date.
    ///
    /// - parameter date: The date to compare to.
    ///
    /// - returns: True if self is before input date, false otherwise.
    func isBefore(_ date: Date) -> Bool{
        return self.compare(date) == .orderedAscending
    }

    /// Check if self is after input date.
    ///
    /// - parameter date: The date to compare to.
    ///
    /// - returns: True if self is after input date, false otherwise.
    func isAfter(_ date: Date) -> Bool{
        return self.compare(date) == .orderedDescending
    }
}

//MARK: Adding date
public extension Date{
    fileprivate func _date(byAddingYears years: Int = 0,
                          byAddingMonths months: Int = 0,
                          byAddingDays days: Int = 0,
                          byAddingHours hours: Int = 0,
                          byAddingMinutes minutes: Int = 0,
                          byAddingSeconds seconds: Int = 0) -> Date?{
        var dc = DateComponents()
        dc.year = years
        dc.month = months
        dc.day = days
        dc.hour = hours
        dc.minute = minutes
        dc.second = seconds
        return calendar.date(byAdding: dc, to: self)
    }
    
    
    /// Return a new Date instance by adding n years to it.
    ///
    /// - parameter years: Number of years to add.
    ///
    /// - returns: The new Date.
    func date(byAddingYears years: Int) -> Date?{
        return _date(byAddingYears: years)
    }
    
    
    /// Return a new Date instance by adding n months to it.
    ///
    /// - parameter months: Number of months to add.
    ///
    /// - returns: The new Date.
    func date(byAddingMonths months: Int) -> Date?{
        return _date(byAddingMonths: months)
    }
    
    
    /// Return a new Date instance by adding n days to it.
    ///
    /// - parameter days: Number of days to add.
    ///
    /// - returns: The new Date.
    func date(byAddingDays days: Int) -> Date?{
        return _date(byAddingDays: days)
    }
    
    
    /// Return a new Date instance by adding n hours to it.
    ///
    /// - parameter hours: Number of hours to add.
    ///
    /// - returns: The new Date.
    func date(byAddingHours hours: Int) -> Date?{
        return _date(byAddingHours: hours)
    }
    
    
    /// Return a new Date instance by adding n minutes to it.
    ///
    /// - parameter minutes: Number of minutes to add.
    ///
    /// - returns: The new Date.
    func date(byAddingMinutes minutes: Int) -> Date?{
        return _date(byAddingMinutes: minutes)
    }
    
    
    /// Return a new Date instance by adding n seconds to it.
    ///
    /// - parameter seconds: Number of seconds to add.
    ///
    /// - returns: The new Date.
    func date(byAddingSeconds seconds: Int) -> Date?{
        return _date(byAddingSeconds: seconds)
    }
    
    
}
