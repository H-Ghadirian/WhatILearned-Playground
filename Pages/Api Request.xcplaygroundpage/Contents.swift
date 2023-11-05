//: [Previous](@previous)

import Foundation

@available(iOS 8.0, *)
public enum APIRouter {
    case getAuthorities
    case getRatings
    case getEstablishments(authorityId: Int)

    public var host: String {
        switch self {
        case .getAuthorities, .getRatings, .getEstablishments:
            return "api.ratings.food.gov.uk"
        }
    }

    public var scheme: String {
        switch self {
        case .getAuthorities, .getRatings, .getEstablishments:
            return "https"
        }
    }

    public var path: String {
        switch self {
        case .getAuthorities:
            return "/authorities/basic"
        case .getRatings:
            return "/ratings"
        case .getEstablishments:
            return "/establishments"
        }
    }

    public var method: String {
        switch self {
        case .getAuthorities, .getRatings, .getEstablishments:
            return "GET"
        }
    }

    public var parameters: [URLQueryItem] {
        switch self {
        case .getAuthorities, .getRatings:
            return []
        case .getEstablishments(let authorityId):
            return [URLQueryItem(name: "localAuthorityId", value: "\(authorityId)")]
        }
    }
}

public struct Rating: Codable {

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(ratingKey, forKey: .ratingKey)
        try container.encode(ratingKeyName, forKey: .ratingKeyName)
        try container.encode(schemeId, forKey: .schemeId)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int?.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.ratingKey = try container.decode(String.self, forKey: .ratingKey)
        self.ratingKeyName = try container.decode(String.self, forKey: .ratingKeyName)
        self.schemeId = try container.decode(Int.self, forKey: .schemeId)
    }
    public var id: Int?
    public var name: String
    public var ratingKey: String
    public var ratingKeyName: String
    public var schemeId: Int

    public enum CodingKeys: String, CodingKey {
        case id = "ratingId"
        case name = "ratingName"
        case ratingKey
        case ratingKeyName
        case schemeId = "schemeTypeId"
    }
}

@available(iOS 8.0, *)
public class APIRequestDispatcher {
    public class func request<T: Codable>(apiRouter: APIRouter) async throws -> T {
        var components = URLComponents()
        components.host = apiRouter.host
        components.scheme = apiRouter.scheme
        components.path = apiRouter.path
        components.queryItems = apiRouter.parameters

        guard let url = components.url else { throw APIRequestError.badUrl }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRouter.method
        urlRequest.addValue("2", forHTTPHeaderField: "x-api-version")
        let session = URLSession(configuration: .default)

        return try await withCheckedThrowingContinuation { continuation in
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    return continuation.resume(with: .failure(error))
                }

                guard let data = data else {
                    return continuation.resume(with: .failure(APIRequestError.noData))
                }

                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        return continuation.resume(with: .success(responseObject))
                    }
                } catch {
                    return continuation.resume(with: .failure(error))
                }
            }
            dataTask.resume()
        }
    }
}

public enum APIRequestError: Error {
    case badUrl, noData
}

public struct AuthoritiesResponse: Codable {
    var authorities: [Authority]
}

public struct RatingsResponse: Codable {
    let ratings: [Rating]
}

public struct Establishment: Codable {

    let id: Int?
    let rating: String
    let ratingKey: String

    enum CodingKeys: String, CodingKey {
        case id = "FHRSID"
        case rating = "RatingValue"
        case ratingKey = "RatingKey"
    }
}

public struct EstablishmentResponse: Codable {
    let establishments: [Establishment]
}

public protocol EstablishmentProtocol {
    func getEstablishments(authorityId: Int) async throws -> [Establishment]
}

public class EstablishmentClient: EstablishmentProtocol {
    public init() {}

    public func getEstablishments(authorityId: Int) async throws -> [Establishment] {
        let response: EstablishmentResponse = try await APIRequestDispatcher.request(
            apiRouter: APIRouter.getEstablishments(authorityId: authorityId)
        )
        return response.establishments
    }
}

public protocol RatingProtocol {
    func getRatings(schemeTypeId: Int) async throws -> [Rating]
}

public class RatingClient: RatingProtocol {
    public init() {}

    public func getRatings(schemeTypeId: Int) async throws -> [Rating] {
        let response: RatingsResponse = try await APIRequestDispatcher.request(apiRouter: APIRouter.getRatings)
        return response.ratings.filter({ $0.schemeId == schemeTypeId })
    }
}

public struct Authority: Codable {

    public var id: Int
    public var name: String
    public var schemeType: Int
    
    public init(id: Int, name: String, schemeType: Int) {
        self.id = id
        self.name = name
        self.schemeType = schemeType
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "LocalAuthorityId"
        case name = "Name"
        case schemeType = "SchemeType"
    }
}

public protocol AuthorityProtocol {
    func getAuthorities() async throws -> [Authority]
}

public class AuthorityClient: AuthorityProtocol {
    public init() {}

    public func getAuthorities() async throws -> [Authority] {
        let response: AuthoritiesResponse = try await APIRequestDispatcher.request(apiRouter: APIRouter.getAuthorities)
        return response.authorities
    }
}

Task.init {
    do {
        var authorityClient = AuthorityClient()
        var authorities = try await authorityClient.getAuthorities()
        print(authorities.count)

        var ratingClient = RatingClient()
        var ratings = try await ratingClient.getRatings(schemeTypeId: 1)
        print(ratings.count)

        let establishmentClient = EstablishmentClient()
        var establishments: [Establishment] = try await establishmentClient.getEstablishments(authorityId: authorities[0].id)
        print(establishments.count)
    } catch {
        print("Fetching establishments failed with error \(error)")
    }
}
//: [Next](@next)
