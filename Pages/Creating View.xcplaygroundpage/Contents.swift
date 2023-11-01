//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

let compareProgressViews = CompareProgressViews()
// https://www.swiftbysundell.com/articles/avoiding-anyview-in-swiftui/

let secondView = StateBindingView()
PlaygroundPage.current.setLiveView(
    VStack {
        compareProgressViews
            .frame(width: 500.0, height: 500.0)
        secondView
            .frame(width: 500.0, height: 100.0)
    }
)

//PlaygroundPage.current.liveView = UIHostingController(rootView: ExampleOfSegmentedProgressView())

//: [Next](@next)
