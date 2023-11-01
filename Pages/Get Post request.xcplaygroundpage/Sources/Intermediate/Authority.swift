import Foundation

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
