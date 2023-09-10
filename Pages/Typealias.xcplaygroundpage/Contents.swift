//: [Previous](@previous)

import Foundation

typealias StudentName = String
var myStudent: StudentName?

func getName(name: StudentName) -> String {
    return name
}

print(type(of: myStudent))
myStudent = "Hamed"
if let myStudent = myStudent {
    print(getName(name: myStudent))
}
//: [Next](@next)
