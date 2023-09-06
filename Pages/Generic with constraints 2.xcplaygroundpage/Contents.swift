//: [Previous](@previous)

import Foundation

protocol Identifiable {
     var id: Int { get }
}

enum ServerResponseType<Model: Identifiable> {
    case serverError
    case internetConnectionFailure
    case emptyData
    case nilData
    case response(Model)
}

struct Product: Identifiable {
    let name: String
    let id: Int
}

struct Service {
    let serviceName: String
}

let parsedProduct = Product(name: "Laptop", id: 0)
let productResponse = ServerResponseType.response(parsedProduct)

let parsedService = Service(serviceName: "CustomerCare")
//let serviceResponse = ServerResponseType.response(parsedService) // 👈here compiler will prompt error
//as 👉 Generic enum 'ServerResponseType' requires that 'Service' conform to 'Identifiab

//: [Next](@next)
