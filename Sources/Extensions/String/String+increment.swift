import Foundation

extension String {
    public func increment(by: Int = 1) -> String? {
        var likes = Int(self)
        likes? += by
        if let likes = likes {
            return String(likes)
        }
        return nil
    }
}
