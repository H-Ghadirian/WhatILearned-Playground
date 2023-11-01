import Foundation

public struct ToDoResponseModel: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
