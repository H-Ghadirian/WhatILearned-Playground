//: [Previous](@previous)

import Foundation

extension String {
    var isRTL: Bool {
        let lang = CFStringTokenizerCopyBestStringLanguage(
            self as CFString,
            CFRange(location: 0, length: self.count)
        )

        if let lang {
            let direction = NSLocale.characterDirection(forLanguage: lang as String)
            return direction == .rightToLeft
        }
        
        return false
    }
}

var greeting = "سلام"
print(greeting.isRTL)
greeting = "welcome"
print(greeting.isRTL)

//: [Next](@next)
