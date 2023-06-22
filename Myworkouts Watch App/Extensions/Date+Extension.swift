//
//  Date+Extension.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 22/06/2023.
//

import Foundation
extension Date {

    struct CustomDateFormatter {

        static var currentTimeZone = TimeZone.current //Set default timeZone that you want

        static func dateFormatter(withFormat format: String) -> DateFormatter {
            let formatter = DateFormatter()
            formatter.timeZone = CustomDateFormatter.currentTimeZone
            formatter.dateFormat = format
            return formatter
        }
    }

    func toDateString(withFormat format: String) -> String {
        return CustomDateFormatter.dateFormatter(withFormat: format).string(from: self)
    }
}
