//: [Previous](@previous)

import Foundation

//let serialQueue = DispatchQueue(label: "swiftlee.serial.queue")
//
//serialQueue.sync {
//    print("serialQueue Task 1 started")
//    // Do some work..
//    Thread.sleep(forTimeInterval: 2)
//    print("serialQueue Task 1 finished")
//}
//serialQueue.sync {
//    print("serialQueue Task 2 started")
//    // Do some work..
//    Thread.sleep(forTimeInterval: 1)
//    print("serialQueue Task 2 finished")
//}

let concurrentQueue = DispatchQueue(label: "swiftlee.concurrent.queue", attributes: .concurrent)

concurrentQueue.sync {
    DispatchQueue.main.async {
        print("concurrentQueue Task 1 started")
    }
    // Do some work.
    Thread.sleep(forTimeInterval: 1)
    DispatchQueue.main.async {
        print("concurrentQueue Task 1 finished")
    }
}

concurrentQueue.sync {
    DispatchQueue.main.async {
        print("concurrentQueue Task 2 started")
    }
    // Do some work..
    Thread.sleep(forTimeInterval: 1)
    DispatchQueue.main.async {
        print("concurrentQueue Task 2 finished")
    }
}

//: [Next](@next)
