//: [Previous](@previous)

import Foundation

class ArrayIterator<T: Equatable>: IteratorProtocol {

    private let values: [T]
    private var index: Int = .zero

    init?(_ values: [T]) {
        if values.isEmpty { return nil }
        self.values = values
    }

    func current() -> T? {
        return values.element(at: index)
    }

    func reset() {
        index = .zero
    }

    func next() -> T? {
        if index + 1 <= values.count - 1 {
            self.index += 1
            return self.values[index]
        }
        return nil
    }

    func prev() -> T? {
        if index - 1 >= 0 {
            self.index -= 1
            return self.values[index]
        }
        return nil
    }

    func moveTo(data: T) {
        index = values.index(of: data) ?? .zero
    }
}

extension Array {
    func element(at index: Int) -> Element? {
        guard index >= 0, self.indices.count > index else { return nil }
        return self[index]
    }
}

extension Array where Element: Equatable {
    func iterator(initial: Element? = nil) -> ArrayIterator<Element>? {
        let iterator = ArrayIterator(self)
        if let data = initial {
            iterator?.moveTo(data: data)
        }
        return iterator
    }
}

var testArray = [8,2,5,999,1,100]
var testArrayIterator = ArrayIterator(testArray)
print(testArrayIterator?.current())
var movedTo = testArrayIterator?.moveTo(data: 999)
print(testArrayIterator?.current())
//testArray.iterator(initial: <#T##Element?#>)
//: [Next](@next)
