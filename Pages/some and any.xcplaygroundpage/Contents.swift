//: [Previous](@previous)
import Foundation

protocol Vehicle {

    var name: String { get }

    associatedtype FuelType
    func fillGasTank(with fuel: FuelType)
}

struct Car: Vehicle {

    let name = "car"

    func fillGasTank(with fuel: Gasoline) {
        print("Fill \(name) with \(fuel.name)")
    }
}

struct Bus: Vehicle {

    let name = "bus"

    func fillGasTank(with fuel: Diesel) {
        print("Fill \(name) with \(fuel.name)")
    }
}

struct Gasoline {
    let name = "gasoline"
}

struct Diesel {
    let name = "diesel"
}

let vehicles: [some Vehicle] = [
    Car(),
    Car(),
    Car(),
]

// error: cannot convert value of type 'Bus' to expected element type 'Car'
// Bus(),
//let vehicles: [some Vehicle] = [
//    Car(),
//    Car(),
//    Bus(),
//]

var myCar: some Vehicle = Car()

// error: cannot assign value of type 'Car' to type 'some Vehicle'
//myCar = Car()

// error: cannot assign value of type 'Bus' to type 'some Vehicle'
//myCar = Bus()

//error: function declares an opaque return type 'some Vehicle', but the return statements in its body do not have matching underlying types

//func createSomeVehicle(isPublicTransport: Bool) -> some Vehicle {
//    if isPublicTransport {
//        return Bus()
//    } else {
//        return Car()
//    }
//}

// error: use of protocol 'Vehicle' as a type must be written 'any Vehicle'
//let theCar: Vehicle = Car()

let newCar: any Vehicle = Car() // ✅ No compile error in Swift 5.7

// 🔴 Compile error in Swift 5.7: Use of protocol 'Vehicle' as a type must be written 'any Vehicle'
//func wash(_ vehicle: Vehicle)  {
//    // Wash the given vehicle
//    print(vehicle.name)
//}

// ✅ No compile error in Swift 5.7
func wash(_ vehicle: any Vehicle)  {
    // Wash the given vehicle
    print(vehicle.name)
}

// ✅ No compile error when changing the underlying data type
var myCar: any Vehicle = Car()
myCar = Bus()
myCar = Car()

// ✅ No compile error when returning different kind of concrete type
func createAnyVehicle(isPublicTransport: Bool) -> any Vehicle {
    if isPublicTransport {
        return Bus()
    } else {
        return Car()
    }
}
//: [Next](@next)
