import Foundation

public struct ToDoHttpBodyRequestModel: Encodable {
    var userId: Int
    var title: String
    var completed: Bool
}
