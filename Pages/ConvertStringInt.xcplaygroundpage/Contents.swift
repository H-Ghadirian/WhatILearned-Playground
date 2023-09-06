//: [Previous](@previous)

import Foundation

//var number = "3.2"
var number = "32"
print(update(numberOfLikes: number) ?? "failed")

private func update(numberOfLikes: String) -> String? {
    var likes = Int(numberOfLikes)
    likes? += 1
    if let likes = likes {
        return String(likes)
    }
    return nil
}

//: [Next](@next)
