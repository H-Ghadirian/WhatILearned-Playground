//: [Previous](@previous)

import Foundation
extension String {
    var jsonDictionary: [String: Any]? {
        return (
            try? JSONSerialization.jsonObject(with: Data(self.utf8), options: [])
        ) as? [String: Any]
    }
}

let dic = """
{
"name":"hamed"
}
""".jsonDictionary
print(dic)
//: [Next](@next)
