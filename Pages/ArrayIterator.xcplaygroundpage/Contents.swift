//: [Previous](@previous)

import Foundation

var testArray = [8,2,5,999,1,100]
var testArrayIterator = ArrayIterator(testArray)
print(testArrayIterator?.current())
var movedTo = testArrayIterator?.moveTo(data: 999)
print(testArrayIterator?.current())

//: [Next](@next)
