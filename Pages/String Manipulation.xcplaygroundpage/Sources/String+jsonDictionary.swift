import Foundation

extension String {
    var jsonDictionary: [String: Any]? {
        return (
            try? JSONSerialization.jsonObject(with: Data(self.utf8), options: [])
        ) as? [String: Any]
    }
}
