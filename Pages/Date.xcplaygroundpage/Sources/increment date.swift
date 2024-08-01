import Foundation

public func incrementDate() {
    var myDate = Date()
    print(myDate)
    myDate += 1
    print(myDate)
    myDate += 1000
    print(myDate)
    myDate += 9000
    print(myDate)
}

@available(*, deprecated, message: "Dude! find a better way!")
public func decrementDate() {
    var myDate = Date()
    print(myDate)
    myDate -= 1
    print(myDate)
    myDate -= 1000
    print(myDate)
    myDate -= 9000
    print(myDate)
}
