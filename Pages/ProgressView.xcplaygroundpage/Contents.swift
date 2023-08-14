//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

let view = ContentView()
PlaygroundPage.current.setLiveView(
    view
        .frame(width: 500.0, height: 1000.0)
)

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("mini")
            ProgressView()
                .controlSize(.mini)
            Text("small")
            ProgressView()
                .controlSize(.small)
            Text("regular")
            ProgressView()
                .controlSize(.regular)
            Text("large")
            ProgressView()
                .controlSize(.large)
        }
    }
}

//: [Next](@next)
