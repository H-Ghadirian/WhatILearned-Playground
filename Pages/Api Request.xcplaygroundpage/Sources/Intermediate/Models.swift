import Foundation

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
