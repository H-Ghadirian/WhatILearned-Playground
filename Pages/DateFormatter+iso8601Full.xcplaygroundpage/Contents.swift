import UIKit

let dateString = "2023-06-29T14:41:56.35892Z"
let jsonStr = """
{
    "date": "2023-06-29T14:41:56.35892Z"
}
"""

struct Root: Decodable {
    let date: Date
}

let jsonData = Data(jsonStr.utf8)
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601

do {
    let date = try decoder.decode(Root.self, from: jsonData)
    print(date)
} catch {
    print(error.localizedDescription)
}

decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
do {
    let date = try decoder.decode(Root.self, from: jsonData)
    print(date)
} catch {
    print(error.localizedDescription)
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
