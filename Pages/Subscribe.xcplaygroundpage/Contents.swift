//: [Previous](@previous)

import Foundation


//actionSubscriptions[ObservableAction.shoot] = { test in
//    print(test)
//}

bindTo(
    subscription: subscribe,
    stateHandler: { time in
        print(time)
    }
)

actionSubscriptions[ObservableAction.shoot]?(23.0)

//: [Next](@next)
