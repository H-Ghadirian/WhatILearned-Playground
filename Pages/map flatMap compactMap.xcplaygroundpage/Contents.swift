//: [Previous](@previous)

import Foundation

var optionalValue: Int? = 99
print("The value is: \(optionalValue)")
optionalValue.map { print("The value is: \($0)") }

optionalValue = nil
print("The value is: \(optionalValue)")
optionalValue.map { print("The value is: \($0)") }

let mapResult = [1,2,3,4].map({String($0)}) //RESULT: ["1", "2", "3", "4"]
print(mapResult)

let compactMapResult = ["a",nil,"b",nil,"c", nil].compactMap({$0}) //RESULT: ["a", "b", "c"]
print(compactMapResult)

let flatMapResult = [["A"], ["B","C","D"], ["E"]].flatMap({$0}) //RESULT: ["A", "B", "C", "D", "E"]
print(flatMapResult)

let flatMixedArr = ["a", ["b", "c"], ["d"]].flatMap({$0}) //["a", ["b", "c"], ["d"]]
print(flatMixedArr)
//: [Next](@next)
