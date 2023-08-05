//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

let view = ContentView()
//let hostingVC = UIHostingController(rootView: view)
//PlaygroundPage.current.liveView = hostingVC
PlaygroundPage.current.setLiveView(
    view
        .frame(width: 500.0, height: 500.0)
    //provide a width and hight of your choice
)
//: [Next](@next)

extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
}

struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }

            if showDetails {
                Text("Details go here.")
                    .transition(.moveAndScale)
            }
        }
    }
}

