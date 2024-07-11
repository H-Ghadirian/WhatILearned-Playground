import Foundation

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
public func iso8601Decoding() {
    decoder.dateDecodingStrategy = .iso8601
    do {
        let date = try decoder.decode(Root.self, from: jsonData)
        print("Succeed: \(date)")
    } catch {
        print("Failed: \(error.localizedDescription)")
    }
}

// --- 2
public func customISO8601Strategy() {
    decoder.dateDecodingStrategy = .customISO8601Strategy
    do {
        let date = try decoder.decode(Root.self, from: jsonData)
        print("Succeed: \(date)")
    } catch {
        print("Failed: \(error.localizedDescription)")
    }
}

// --- 3
public func iso8601Full() {
    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
    do {
        let date = try decoder.decode(Root.self, from: jsonData)
        print("Succeed: \(date)")
    } catch {
        print("Failed: \(error.localizedDescription)")
    }
}
