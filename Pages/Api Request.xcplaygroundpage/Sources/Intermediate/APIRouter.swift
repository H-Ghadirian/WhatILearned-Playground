import Foundation

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
