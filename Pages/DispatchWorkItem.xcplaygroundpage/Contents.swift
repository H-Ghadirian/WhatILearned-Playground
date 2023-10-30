//: [Previous](@previous)

import Foundation

class Controller {
    var dispatchWorkItem: DispatchWorkItem?

    func getSearchResult(by query: String) {
        dispatchWorkItem?.cancel()
        dispatchWorkItem = DispatchWorkItem {
            print("call backend for \(query)")
        }
        DispatchQueue.global().asyncAfter(
            deadline: .now() + .milliseconds(30),
            execute: dispatchWorkItem!
        )
    }

    func getSomethingAfterFetchSomethingElseFromServer() {
        let fetchFromServerOne = DispatchWorkItem {
            print("receive keys")
        }
        let fetchFromServerTwo = DispatchWorkItem {
            print("request data with the keys we have from Server one!")
        }
//        fetchFromServerOne.notify(queue: .main, execute: fetchFromServerTwo)
        // another approach:
        fetchFromServerOne.notify(queue: .main) {
            fetchFromServerTwo.perform()
        }
        DispatchQueue.global().sync(execute: fetchFromServerOne)
    }

    func getAndWait() {
        let fetchFromServerOne = DispatchWorkItem {
            print("receive something from server befor wait")
            print(Thread.current)
        }
        DispatchQueue.global().sync(execute: fetchFromServerOne)
        print("still on going getAndWait")
        fetchFromServerOne.wait(timeout: .now() + .milliseconds(30000))
        print("finish getAndWait")
    }
}

let controller = Controller()
print("Scenario 1 \n")
// Scenario 1: user type something to search for!
controller.getSearchResult(by: "h")
controller.getSearchResult(by: "he")
Thread.sleep(forTimeInterval: 1)
controller.getSearchResult(by: "hell")
controller.getSearchResult(by: "hell0")

print("\n Scenario 2 \n")
// Scenario 2: load something after something else already loaded
controller.getSomethingAfterFetchSomethingElseFromServer()

// Scenario 3: get and wait
print("\n Scenario 3")
controller.getAndWait()
//: [Next](@next)
