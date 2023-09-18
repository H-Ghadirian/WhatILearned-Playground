//: [Previous](@previous)

import Foundation

var myArray = [1,2,3]
func doSomething(on: Int) {
    print(on)
}

print("--- Approach 1")
myArray.forEach { element in
    doSomething(on: element)
}

print("--- Approach 2")
myArray.forEach {
    doSomething(on: $0)
}

print("--- Approach 3")
myArray.forEach(doSomething(on:))

print("--- Approach 4")
myArray.forEach(doSomething)

//: [Next](@next)
