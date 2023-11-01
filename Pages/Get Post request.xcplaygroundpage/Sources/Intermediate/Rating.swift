import Foundation

public struct Rating: Codable {

    public let id: Int?
    public let name: String
    public let ratingKey: String
    public let ratingKeyName: String
    public let schemeId: Int

    public enum CodingKeys: String, CodingKey {
        case id = "ratingId"
        case name = "ratingName"
        case ratingKey
        case ratingKeyName
        case schemeId = "schemeTypeId"
    }
}
