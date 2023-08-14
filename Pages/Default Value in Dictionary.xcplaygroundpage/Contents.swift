//: [Previous](@previous)

import Foundation

let source = ["a", "b", "c", "s", "w", "a", "a", "s"]
var counter: [String: Int] = [:]

for c in source {
    // 1
    counter[c, default: 0] += 1
//    counter[c] += 1 // erro: force-unwrap using '!' to abort execution if the optional value contains 'nil'
}

print(counter)

//: [Next](@next)
