//: [Previous](@previous)

import Foundation

let defaults = UserDefaults.standard

var age = defaults.integer(forKey:"Age")
print(age)

defaults.set(25, forKey: "Age")

age = defaults.integer(forKey:"Age")
print(age)

//: [Next](@next)
