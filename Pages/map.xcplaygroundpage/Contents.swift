//: [Previous](@previous)

import Foundation

var optionalValue: Int? = 99
print("The value is: \(optionalValue)")
optionalValue.map { print("The value is: \($0)") }

optionalValue = nil
print("The value is: \(optionalValue)")
optionalValue.map { print("The value is: \($0)") }
//: [Next](@next)
