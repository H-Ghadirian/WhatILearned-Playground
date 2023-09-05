//: [Previous](@previous)

import Foundation

enum IsThereParameterLimit {
    case first(paraOne: String, paraTwo: String, paraThree: String, paraFour: String, paraFive: String, paraSix: String)
    var value: String {
        switch self {
        case .first:
            return "first"
        }
    }
}
print(
    IsThereParameterLimit.first(paraOne: "1", paraTwo: "2", paraThree: "3", paraFour: "4", paraFive: "5", paraSix: "6").value
)
//: [Next](@next)
