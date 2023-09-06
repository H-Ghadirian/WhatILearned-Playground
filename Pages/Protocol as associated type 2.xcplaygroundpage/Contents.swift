//: [Previous](@previous)

import Foundation

// Let's recollect all the generic concepts that we just learn by below given example.
protocol Identifiable {
     associatedtype IDType
     var id: IDType { get } // var id: Self.IDType
}

enum ContainerTypeCategory {
    case electronic, furniture, food, automobile, clothes, toys
}

protocol ContainerLocation {
    var locationArea: String { get set }
}

protocol ContainerType: Identifiable, ContainerLocation, Equatable {
    var containerTypeCategory: ContainerTypeCategory { get set }
    init(id: Int, locationArea: String)
}

protocol Product {
    var productName: String { get set }
    var containerTypeCategory: ContainerTypeCategory { get set }
    init(productName: String)
}

protocol ProductContainer {
    associatedtype ProductContainerType: ContainerType
    // 👆 whatever ProductContainerType you decide, It must confirm ContainerType Protocol
    associatedtype Branch: ProductContainer where Branch.ProductContainerType == ProductContainerType
    // 👆 in above example please note that, we have used where clause to set constraints for Branch type such that
    // its ProductContainerType (Branch.ProductContainerType) must be the exact type of wrapper container's (ProductContainerType),
    // Please check example further for more clarification.
    
    var container: ProductContainerType { get set }
    
    init(container: ProductContainerType)
    
    var products: [Product] { get set }
    var associatedBranches: [Branch] { get set }
    
    mutating func add(_ product: Product)
    var count: Int { get }
    subscript(index: Int) -> Product { get }
}

//ProductContainer for all the electronic items
class ElectronicContainer: ContainerType {

   //Confirming Container protocol
    var id : Int
    
    required init(id: Int, locationArea: String) {
        self.id = id
        self.locationArea = locationArea
    }
    
    var containerTypeCategory: ContainerTypeCategory = .electronic
    
    //Confirming ContainerLocation
    var locationArea: String
    
    //Confirming Equatable protocol
    static func == (lhs: ElectronicContainer, rhs: ElectronicContainer) -> Bool {
       return lhs.id == rhs.id
    }
}

//ProductContainer for all the furniture items
class FurnitureContainer: ContainerType {

   //Confirming Container protocol
    var id : Int
    
    required init(id: Int, locationArea: String) {
        self.id = id
        self.locationArea = locationArea
    }
    
    var containerTypeCategory: ContainerTypeCategory = .furniture
    
    //Confirming ContainerLocation
    var locationArea: String
    
    //Confirming Equatable protocol
    static func == (lhs: FurnitureContainer, rhs: FurnitureContainer) -> Bool {
       return lhs.id == rhs.id
    }
}

//Warehouse is the ProductContainer, which can contain a particular type of products.
//Rather creating different warehouses for each product, let's create one generic warehouse 😉
// 👇 Generic warehouse which can associcate any Type ("Container" used as placeholder) that must confirm ContainerType protocol.
struct Warehouse<Container: ContainerType>: ProductContainer {
   
    typealias ProductContainerType = Container
    typealias Branch = Warehouse
       
    var container: Container
    var products: [Product] = []
    var associatedBranches: [Branch] = []
    
    init(container: Container) {
       self.container = container
    }
       
    mutating func add(_ product: Product) {
        products.append(product)
    }
    
    var count: Int { return products.count }
    
    subscript(index: Int) -> Product {
        return products[index]
    }
}

/* ---- Products ---- */

struct ElectronicProduct: Product {
    var containerTypeCategory: ContainerTypeCategory = .electronic
    var productName: String

    init(productName: String) {
        self.productName = productName
    }
}

struct FurnitureProduct: Product {
    var containerTypeCategory: ContainerTypeCategory = .furniture
    var productName: String

    init(productName: String) {
        self.productName = productName
    }
}

//Lets see how all these above types work together
var electronicWarehousePune = Warehouse<ElectronicContainer>(container: ElectronicContainer(id: 0, locationArea: "Pune"))
var electronicWarehouseMumbai = Warehouse<ElectronicContainer>(container: ElectronicContainer(id: 2, locationArea: "Mumbai"))
// 👆 in above examples <ElectronicContainer> making sure that this warehouse is only dedicated for ElectronicContainer
// Above initialization also can be written without angular brackets as
// 👉 Warehouse(container: ElectronicContainer(id: 0, locationArea: "Pune"))
// here Generic type is decided by just passing ElectronicContainer
var furnitureWarehouseBengaluru = Warehouse<FurnitureContainer>(container: FurnitureContainer(id: 3, locationArea: "Bengaluru"))
var furnitureWarehouseChennai = Warehouse<FurnitureContainer>(container: FurnitureContainer(id: 4, locationArea: "Chennai"))
// 👆 in above examples <FurnitureContainer> making sure that this warehouse is only dedicated for FurnitureContainer
// There are two branches who keep electronic items
let electronicBranches = [electronicWarehousePune, electronicWarehouseMumbai]

electronicWarehousePune.associatedBranches = electronicBranches
electronicWarehousePune.add(ElectronicProduct(productName: "Laptop"))
electronicWarehousePune.add(ElectronicProduct(productName: "TV"))
electronicWarehousePune.add(ElectronicProduct(productName: "Mobile"))
electronicWarehousePune.add(ElectronicProduct(productName: "Earphones"))

print("\(electronicWarehousePune.products) at warehouse location \(electronicWarehousePune.container.locationArea) ")
print("")

electronicWarehouseMumbai.associatedBranches = electronicBranches
electronicWarehouseMumbai.add(ElectronicProduct(productName: "Bluetooth"))
electronicWarehouseMumbai.add(ElectronicProduct(productName: "USB cables"))
electronicWarehouseMumbai.add(ElectronicProduct(productName: "Mouse"))
electronicWarehouseMumbai.add(ElectronicProduct(productName: "Monitors"))

print("\(electronicWarehouseMumbai.products) at warehouse location \(electronicWarehouseMumbai.container.locationArea) ")
print("")

// There are two branches who keep furniture items
let furnitureBranches = [furnitureWarehouseBengaluru, furnitureWarehouseChennai]

furnitureWarehouseBengaluru.associatedBranches = furnitureBranches
furnitureWarehouseBengaluru.add(FurnitureProduct(productName: "Chair"))
furnitureWarehouseBengaluru.add(FurnitureProduct(productName: "Table"))
furnitureWarehouseBengaluru.add(FurnitureProduct(productName: "Couch"))
furnitureWarehouseBengaluru.add(FurnitureProduct(productName: "Bed"))

print("\(furnitureWarehouseBengaluru.products) at warehouse location \(furnitureWarehouseBengaluru.container.locationArea) ")
print("")

furnitureWarehouseChennai.associatedBranches = furnitureBranches
furnitureWarehouseChennai.add(FurnitureProduct(productName: "Dresing Table"))
furnitureWarehouseChennai.add(FurnitureProduct(productName: "Dining Table"))
furnitureWarehouseChennai.add(FurnitureProduct(productName: "Study table"))
furnitureWarehouseChennai.add(FurnitureProduct(productName: "Wooden Cupboard"))

print("\(furnitureWarehouseChennai.products) at warehouse location \(furnitureWarehouseChennai.container.locationArea) ")

//: [Next](@next)
