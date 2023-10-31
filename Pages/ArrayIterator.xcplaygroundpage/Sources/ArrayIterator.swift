import Foundation

public class ArrayIterator<T: Equatable>: IteratorProtocol {

    private let values: [T]
    private var index: Int = .zero

    public init?(_ values: [T]) {
        if values.isEmpty { return nil }
        self.values = values
    }

    public func current() -> T? {
        return values.element(at: index)
    }

    public func reset() {
        index = .zero
    }

    public func next() -> T? {
        if index + 1 <= values.count - 1 {
            self.index += 1
            return self.values[index]
        }
        return nil
    }

    public func prev() -> T? {
        if index - 1 >= 0 {
            self.index -= 1
            return self.values[index]
        }
        return nil
    }

    public func moveTo(data: T) {
        index = values.firstIndex(of: data) ?? .zero
    }
}

public extension Array {
    func element(at index: Int) -> Element? {
        guard index >= 0, self.indices.count > index else { return nil }
        return self[index]
    }
}

public extension Array where Element: Equatable {
    func iterator(initial: Element? = nil) -> ArrayIterator<Element>? {
        let iterator = ArrayIterator(self)
        if let data = initial {
            iterator?.moveTo(data: data)
        }
        return iterator
    }
}
