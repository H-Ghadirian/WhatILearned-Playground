//: [Previous](@previous)

// Example 1

class Book {
    var name: String
    var readPage = 0
    init(name: String, readPage: Int = 0) {
        self.name = name
        self.readPage = readPage
    }
}

var harryPotterBook = Book(name: "Harry Potter")
func experiment() {
    
    var myLibrary: [Book] = []
    myLibrary.append(consume harryPotterBook)
    myLibrary[0].readPage = 10

    harryPotterBook = Book(name: "Harry Potter 2")
    harryPotterBook.readPage = 12
}

experiment()

// Example 2
//: [Next](@next)
