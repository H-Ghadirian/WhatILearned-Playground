import UIKit

//let dateString = "2023-06-29T14:41:56.35892Z"
let jsonStr = """
{
    "date": "2023-06-29T14:41:56.35892Z"
}
"""
//"2023-08-10T11:19:37.459Z"
struct Root: Decodable {
    let date: Date
}

let jsonData = Data(jsonStr.utf8)
let decoder = JSONDecoder()

// --- 1
decoder.dateDecodingStrategy = .iso8601
do {
    let date = try decoder.decode(Root.self, from: jsonData)
    print("Succeed: \(date)")
} catch {
    print("Failed: \(error.localizedDescription)")
}

// --- 2
decoder.dateDecodingStrategy = .customISO8601Strategy
do {
    let date = try decoder.decode(Root.self, from: jsonData)
    print("Succeed: \(date)")
} catch {
    print("Failed: \(error.localizedDescription)")
}

// --- 3
decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
do {
    let date = try decoder.decode(Root.self, from: jsonData)
    print("Succeed: \(date)")
} catch {
    print("Failed: \(error.localizedDescription)")
}

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
      formatter.calendar = Calendar(identifier: .iso8601)
      formatter.timeZone = TimeZone(secondsFromGMT: 0)
      formatter.locale = Locale(identifier: "de_DE")
      return formatter
    }()
}

extension JSONDecoder.DateDecodingStrategy {
    static let customISO8601Strategy = custom { decoder -> Date in
        let dateString = try decoder.singleValueContainer().decode(String.self)

        let formatterOptions: [ISO8601DateFormatter.Options] = [
            [
                .withFractionalSeconds,
                .withInternetDateTime,
                .withDashSeparatorInDate,
                .withColonSeparatorInTime
            ],
            [
                .withInternetDateTime,
                .withDashSeparatorInDate,
                .withColonSeparatorInTime
            ]
        ]
        let formatter = ISO8601DateFormatter()
        for formatOption in formatterOptions {
            formatter.formatOptions = formatOption
            if let date = formatter.date(from: dateString) {
                return date
            }
        }
        throw DecodingError.dataCorrupted(
            DecodingError.Context(
                codingPath: decoder.codingPath, debugDescription: "Date string not matching required format"
            )
        )
    }
}
