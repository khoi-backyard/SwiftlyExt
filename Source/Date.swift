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
    /// - parameter dateStyle: A DateFormatter.Style. default to `.medium`
    /// - parameter timeStyle: A DateFormatter.Style. default to `.medium`
    /// - parameter locale:    Locale of the string. default to `.locale`
    ///
    /// - returns: The date string.
    func string(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium, locale: Locale = Locale.current) -> String{
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
    func string(format: String, locale: Locale = Locale.current) -> String{
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
