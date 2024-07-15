//: [Previous](@previous)

import Foundation

enum Tag: String, CaseIterable {
    case animation
    case swiftui
    case userInterface
    case networking
    case storage
    case functionality
    case architecture
    case library
}

var tags: [String] = Tag.allCases.map { $0.rawValue }
print(tags)
//: [Next](@next)
