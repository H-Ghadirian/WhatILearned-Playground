//: [Previous](@previous)

import Foundation

let keys = ["a", "b", "c"]
let values = [1, 2, 3]
let theZip = zip(keys, values)
print(theZip)
let keyValuePairs = Dictionary(uniqueKeysWithValues: theZip)
print(keyValuePairs)
//: [Next](@next)
