//: [Previous](@previous)

import Foundation

let requestData = [
    "customer_id": "userId",
    "source": "HELLO_APP",
    "customer_number": "",
    "follow_context": [
        "origin": ""
    ]
] as [String : Any]

if let httpBody = try? JSONSerialization.data(withJSONObject: requestData, options: []) {
    print(httpBody)
}

//: [Next](@next)
