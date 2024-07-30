import Foundation

public enum Basket: String {
    case unknown = "Unknown"
    case productNotFound = "ProductNotFound"
    public func callAsFunction() -> String {
        return self.rawValue
    }
}

public enum Tag: String, CaseIterable {
    case animation
    case swiftui
    case userInterface
    case networking
    case storage
    case functionality
    case architecture
    case library
}
