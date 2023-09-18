//: [Previous](@previous)

import Foundation

extension Dictionary {
    var data: Data {
        try! JSONSerialization.data(withJSONObject: self, options: .sortedKeys)
    }
}

var personDic = [
    "name": "Tom"
]

var dogDic = [
    "name": "Tom"
]

if personDic.data == dogDic.data {
    print("They are the same!")
} else {
    print("They are different!")
}
//: [Next](@next)
