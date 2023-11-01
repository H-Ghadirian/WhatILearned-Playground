import Foundation

public protocol AuthorityProtocol {
    func getAuthorities() async throws -> [Authority]
}

public class AuthorityClient: AuthorityProtocol {
    public init() {}

    public func getAuthorities() async throws -> [Authority] {
        let response: AuthoritiesResponse = try await APIRequestDispatcher.request(apiRouter: .getAuthorities)
        return response.authorities
    }
}
