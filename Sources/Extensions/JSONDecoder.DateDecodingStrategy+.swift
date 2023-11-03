import Foundation
import UIKit

public extension JSONDecoder.DateDecodingStrategy {
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
