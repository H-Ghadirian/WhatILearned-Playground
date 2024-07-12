import Foundation

public typealias ActionSubscription = (ObservableAction, @escaping (Any) -> Void) -> Void

public enum ObservableAction {
    case shoot
    case fill
}

public var actionSubscriptions: [ObservableAction: (Any) -> Void] = [:]

public func bindTo(subscription: ActionSubscription, stateHandler: @escaping (Double) -> Void) {
    print("bindTo")
    subscription(.shoot) { time in
        print("bindTo \(time)")
        if let time = time as? Double {
            print("bindTo \(time)")
            stateHandler(time)
        } else {
            print("it is not double!!!")
        }
    }
}

public func subscribe(for event: ObservableAction, with handler: @escaping (Any) -> Void) {
    print("subscribe event: \(event)")
    actionSubscriptions[event] = handler
}
