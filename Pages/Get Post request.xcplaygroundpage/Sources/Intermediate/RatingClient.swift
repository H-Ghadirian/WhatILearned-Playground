import Foundation

public protocol RatingProtocol {
    func getRatings(schemeTypeId: Int) async throws -> [Rating]
}

public class RatingClient: RatingProtocol {
    public init() {}

    public func getRatings(schemeTypeId: Int) async throws -> [Rating] {
        let response: RatingsResponse = try await APIRequestDispatcher.request(apiRouter: .getRatings)
        return response.ratings.filter({ $0.schemeId == schemeTypeId })
    }
}
