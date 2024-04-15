//import Foundation
//
//protocol Resource {
//    var isConsumable: Bool { get set }
//    var name: String { get set }
//}
//
//struct Fuel: Resource {
//    var name: String
//    var isConsumable: Bool
//}
//
//struct Book: Resource {
//    var name: String
//    var isConsumable: Bool
//}
//
//func createFuel() -> Resource {
//    return Fuel(name: "Oil", isConsumable: true)
//}
//
//func createBook() -> Resource {
//    return Fuel(name: "Harry Potter", isConsumable: false)
//}
//
////static let resource = Fuel(name: "Harry Potter", isConsumable: false)
//
//struct MyVariables {
//    static let yourVariable: Fuel = Fuel(name: "Harry Potter", isConsumable: false)
//}
//
//func experimentOne() {
////    var resource = createBook()
////    if resource.isConsumable {
//    _ = consume MyVariables.yourVariable
////    }
////    resource = createFuel()
////    passToFriend(resource.name)
//}
//
//func experimentTwo() {
////    var resource = createBook()
////    if resource.isConsumable {
////        _ = consume resource
////    }
////    resource = createFuel()
//    passToFriend(MyVariables.yourVariable.name)
//}
//
//func passToFriend(_ resource: String) {
//    print(resource)
//}
//
//experimentOne()
////: [Next](@next)
