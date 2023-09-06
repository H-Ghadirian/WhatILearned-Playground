//: [Previous](@previous)

import Foundation

enum ServerResponseType<Model> {
    case serverError
    case response(Model)
}

struct Service {
    let serviceName: String
    let id: Int
}

struct Product {
    let name: String
    let id: Int
}

let parsedProduct = Product(name: "Laptop", id: 0)

// 👉 Enum with association of Product
let productResponse = ServerResponseType.response(parsedProduct)

switch productResponse {
case .serverError: break
case .response(let product):
    print(product.name)
}

let parsedService = Service(serviceName: "CustomerCare", id: 0)

// 👉 Enum with association of Service
let serviceResponse = ServerResponseType.response(parsedService)

switch serviceResponse {
case .serverError: break
case .response(let service):
    print(service.serviceName)
}

//: [Next](@next)
