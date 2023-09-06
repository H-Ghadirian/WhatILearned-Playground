//: [Previous](@previous)

import Foundation

protocol Identifiable {
    associatedtype IDType
    var id: IDType { get } // var id: Self.IDType
}

//struct Product: Identifiable {
//    let name: String
//    let id: Int
//}

struct Product: Identifiable {
    typealias IDType = Int // Now Int is equalant to Self.IDType
    let name: String
    let id: Int
}

//: [Next](@next)
