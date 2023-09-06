//: [Previous](@previous)

import Foundation

func printArray<T>(collection: [T]) {
    for item in collection {
        print(item, terminator: " ")
    }
}

printArray(collection: [1, 2, 3, 4, 5]) //1 2 3 4 5
print("")
printArray(collection: ["one", "two", "three", "four", "Five"]) //one two three four five
print("")
printArray(collection: ["one", 1])
print("")

func hashMap<Key, Value>(key: Key, value: Value) -> Dictionary<Key, Value> {
    return [key: value]
}
print(hashMap(key: "1",value: "One"))
// 👉  ["1": "One"]
//key as String, value as String
print(hashMap(key: 1,value: "One"))
// 👉 [1: 1.0]
//key as Int, value as Double

//: [Next](@next)
