import Foundation

public class ApiRequestHandler {
    public init() {
    }

    public func post() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        guard let requestUrl = url else { fatalError() }

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"

        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let newTodoItem = ToDoHttpBodyRequestModel(userId: 400, title: "Urgent task 2", completed: false)
        do {
            let jsonData = try JSONEncoder().encode(newTodoItem)
            
            request.httpBody = jsonData
        } catch {
            fatalError("failed to encode")
        }

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
    }

    public func getImageData() {
        let url = URL(string: "https://bit.ly/2LMtByx")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
//                let image = UIImage(data: data)
                print("image loaded!")
//                print(String(decoding: data, as: UTF8.self))
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
    }
}
