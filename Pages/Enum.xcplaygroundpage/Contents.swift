//: [Previous](@previous)

import Foundation

var tags: [String] = Tag.allCases.map { $0.rawValue }
print(tags)
//: [Next](@next)

let basket = Basket(rawValue: "something not there")
switch basket {
case .productNotFound, .unknown:
    print("matched")
default:
    print("not matched")
}
print(Basket.productNotFound())
