//: [Previous](@previous)

import Foundation

// modern swaping
var a = 7
var b = 9
(a, b) = (b, a)
print(a)
print(b)

// zipping and make dictionary
let keys = ["a", "b", "c"]
let values = [1, 2, 3]
let theZip = zip(keys, values)
print(theZip)
let keyValuePairs = Dictionary(uniqueKeysWithValues: theZip)
print(keyValuePairs)
//: [Next](@next)
