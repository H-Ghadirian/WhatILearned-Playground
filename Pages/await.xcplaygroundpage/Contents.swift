//: [Previous](@previous)
import Foundation

enum APIRouter {
    case getAuthorities
    case getRatings
    case getEstablishments(authorityId: Int)

    var host: String {
        switch self {
        case .getAuthorities, .getRatings, .getEstablishments:
            return "api.ratings.food.gov.uk"
        }
    }

    var scheme: String {
        switch self {
        case .getAuthorities, .getRatings, .getEstablishments:
            return "https"
        }
    }

    var path: String {
        switch self {
        case .getAuthorities:
            return "/authorities/basic"
        case .getRatings:
            return "/ratings"
        case .getEstablishments:
            return "/establishments"
        }
    }

    var method: String {
        switch self {
        case .getAuthorities, .getRatings, .getEstablishments:
            return "GET"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getAuthorities, .getRatings:
            return []
        case .getEstablishments(let authorityId):
            return [URLQueryItem(name: "localAuthorityId", value: "\(authorityId)")]
        }
    }
}

enum APIRequestError: Error {
    case badUrl, noData
}

class APIRequestDispatcher {
    class func request<T: Codable>(apiRouter: APIRouter) async throws -> T {
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

protocol AuthorityProtocol {
    func getAuthorities() async throws -> [Authority]
}

protocol RatingProtocol {
    func getRatings(schemeTypeId: Int) async throws -> [Rating]
}

protocol EstablishmentProtocol {
    func getEstablishments(authorityId: Int) async throws -> [Establishment]
}

class AuthorityClient: AuthorityProtocol {
    func getAuthorities() async throws -> [Authority] {
        let response: AuthoritiesResponse = try await APIRequestDispatcher.request(apiRouter: .getAuthorities)
        return response.authorities
    }
}

class RatingClient: RatingProtocol {

    func getRatings(schemeTypeId: Int) async throws -> [Rating] {
        let response: RatingsResponse = try await APIRequestDispatcher.request(apiRouter: .getRatings)
        return response.ratings.filter({ $0.schemeId == schemeTypeId })
    }
}

class EstablishmentClient: EstablishmentProtocol {

    func getEstablishments(authorityId: Int) async throws -> [Establishment] {
        let response: EstablishmentResponse = try await APIRequestDispatcher.request(
            apiRouter: .getEstablishments(authorityId: authorityId)
        )
        return response.establishments
    }
}

struct Authority: Codable {
    
    var id: Int
    var name: String
    var schemeType: Int
    
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

struct AuthoritiesResponse: Codable {
    var authorities: [Authority]
}

struct Rating: Codable {

    let id: Int?
    let name: String
    let ratingKey: String
    let ratingKeyName: String
    let schemeId: Int

    enum CodingKeys: String, CodingKey {
        case id = "ratingId"
        case name = "ratingName"
        case ratingKey
        case ratingKeyName
        case schemeId = "schemeTypeId"
    }
}

struct RatingsResponse: Codable {
    let ratings: [Rating]
}

struct Establishment: Codable {

    let id: Int?
    let rating: String
    let ratingKey: String

    enum CodingKeys: String, CodingKey {
        case id = "FHRSID"
        case rating = "RatingValue"
        case ratingKey = "RatingKey"
    }
}

struct EstablishmentResponse: Codable {
    let establishments: [Establishment]
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
        var establishments = try await establishmentClient.getEstablishments(authorityId: authorities[0].id)
        print(establishments.count)
    } catch {
        print("Fetching establishments failed with error \(error)")
    }
}

//: [Next](@next)
