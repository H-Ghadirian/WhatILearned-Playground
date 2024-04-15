//: [Previous](@previous)

import Foundation

public enum SourceType: String, Codable {
    case reco = "RECO"
    case promotionEvent = "GOOGLE_ANALYTICS_PROMOTION"
    case wishlist = "WISHLIST"
    case tvShow = "TV_SHOW"
    case category = "CATEGORY"
    case searchResult = "SEARCH_RESULT"
    case stream = "STREAMS"
}

public enum Parameters {
    case not
    var values: (source: SourceType, text: String?, number: Int?) {
        return (.tvShow, nil, nil)
    }
}

//print(values.number)
//print(values.text)

public struct ItemSource {
    public let source: SourceType
    public let text: String?
    public let number: Int?

    init(params: Parameters) {
        self.source = params.values.source
        self.text = params.values.text
        self.number = params.values.number
    }
}
ItemSource(params: .not)
print("fertig")
//: [Next](@next)
