//: [Previous](@previous)

import Foundation

func fetchLatestNews(completion: @escaping ([String]) -> Void) {
    DispatchQueue.main.async {
        completion(["Swift 5.5 release", "Apple acquires Apollo"])
    }
}

func fetchLatestNews() async -> [String] {
    await withCheckedContinuation { continuation in
        fetchLatestNews { items in
            print("fetched")
            continuation.resume(returning: items)
        }
    }
}

//func printNews() async {
    let items = await fetchLatestNews()
//print(items.count)
//    for item in items {
//        print(item)
//    }
//}
//do {
//    try await printNews()
//} catch(let error) {
//    print(error)
//}
//: [Next](@next)
