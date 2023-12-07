//: [Previous](@previous)

import Foundation

let strings = ["ABC1234", "DEF4567", "ABC123298", "XYZ123A", "DEF789B", "WXYZ123343", "ABC555D", "WXYZ123", "429530002", "429530003", "429530006"]

// Filter strings with more than 6 characters
let filteredStrings = strings.filter { $0.count > 6 }

// Create an empty dictionary to store the grouped strings
var groupedStrings = [String: [String]]()

// Iterate through the filtered array of strings
for str in filteredStrings {
    let key = String(str.prefix(6))
    
    if var group = groupedStrings[key] {
        group.append(str)
        groupedStrings[key] = group
    } else {
        groupedStrings[key] = [str]
    }
}

// Print the grouped strings
for (key, group) in groupedStrings {
    print("Key: \(key), Group: \(group)")
}
//: [Next](@next)
