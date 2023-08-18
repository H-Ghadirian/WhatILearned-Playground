//: [Previous](@previous)

import Foundation

let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
guard let requestUrl = url else { fatalError() }

var request = URLRequest(url: requestUrl)
request.httpMethod = "POST"

// Set HTTP Request Header
request.setValue("application/json", forHTTPHeaderField: "Accept")
request.setValue("application/json", forHTTPHeaderField: "Content-Type")

let newTodoItem = ToDoHttpBodyRequestModel(userId: 400, title: "Urgent task 2", completed: false)
let jsonData = try JSONEncoder().encode(newTodoItem)

request.httpBody = jsonData

let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

    if let error = error {
        print("Error took place \(error)")
        return
    }
    guard let data = data else {return}
    print("Data:\n")
    print(String(decoding: data, as: UTF8.self))

    do{
        let todoItemModel = try JSONDecoder().decode(ToDoResponseModel.self, from: data)
        print("\nResponse data:\n \(todoItemModel)")
        print("todoItemModel Title: \(todoItemModel.title)")
        print("todoItemModel id: \(todoItemModel.id)")
    }catch let jsonErr{
        print(jsonErr)
    }
}

task.resume()

struct ToDoHttpBodyRequestModel: Encodable {
    var userId: Int
    var title: String
    var completed: Bool
}

struct ToDoResponseModel: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}

//: [Next](@next)
