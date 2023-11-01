import Foundation

public protocol EstablishmentProtocol {
    func getEstablishments(authorityId: Int) async throws -> [Establishment]
}

public class EstablishmentClient: EstablishmentProtocol {
    public init() {}

    public func getEstablishments(authorityId: Int) async throws -> [Establishment] {
        let response: EstablishmentResponse = try await APIRequestDispatcher.request(
            apiRouter: .getEstablishments(authorityId: authorityId)
        )
        return response.establishments
    }
}
