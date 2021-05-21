//
//  DateConverter.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 20.05.2021.
//

import Foundation

extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options) {
        self.init()
        self.formatOptions = formatOptions
    }
}

extension Formatter {
    static let iso8601withFractionalSeconds = ISO8601DateFormatter([.withInternetDateTime, .withFractionalSeconds])
}

extension JSONDecoder.DateDecodingStrategy {
    static let iso8601withFractionalSeconds = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        guard let date = Formatter.iso8601withFractionalSeconds.date(from: string) else {
            throw DecodingError.dataCorruptedError(in: container,
                  debugDescription: "Invalid date: " + string)
        }
        return date
    }
}

class DateHelpers {
    
    static func dateToISOString(date: Date) -> String {
        let formatter = Formatter.iso8601withFractionalSeconds
        return formatter.string(from: date)
    }
    
    static func dateToServerString(date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    static func createCustomDecoder() -> JSONDecoder{
        let jd = JSONDecoder()
        jd.dateDecodingStrategy = .iso8601withFractionalSeconds
        return jd
    }

    
}
