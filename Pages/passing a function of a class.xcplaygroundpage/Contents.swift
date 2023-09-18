//: [Previous](@previous)

import Foundation

class QueueHandler {
    private var queue: [Int] = []
    private var componentVisible: Bool = false
    private let actionHandler: (Int) -> Void

    init(actionHandler: @escaping (Int) -> Void) {
        self.actionHandler = actionHandler
    }

    func updateVisibility(_ isVisible: Bool) {
        componentVisible = isVisible
        if isVisible {
            queue.forEach(handle)
            queue = []
        }
    }

    func handle(action: Int) {
        if componentVisible {
            actionHandler(action)
        } else {
            queue.append(action)
        }
    }
}

class VisibilityViewModel {
    private let onVisible: (Bool) -> Void

    public init(onVisible: @escaping (Bool) -> Void) {
        self.onVisible = onVisible
    }

    public func appear() {
        onVisible(true)
    }

    public func disappear() {
        onVisible(false)
    }
}

let queueHandler = QueueHandler() { number in
    print(number)
}
let visibilityViewModel = VisibilityViewModel(onVisible: queueHandler.updateVisibility)

queueHandler.handle(action: 0)
queueHandler.handle(action: 1)

print("And then apear:")
visibilityViewModel.appear()

print("")
print("If apear again nothing will not print:")
visibilityViewModel.appear()

print("")
print("But since it is apear, now it print whatever we ask to handle")
queueHandler.handle(action: 2)
queueHandler.handle(action: 3)


print("")
print("Disappear")
//: [Next](@next)
