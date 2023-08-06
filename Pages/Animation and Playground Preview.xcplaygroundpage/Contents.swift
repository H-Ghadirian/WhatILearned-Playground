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
    static var pushAndSlide: AnyTransition {
        AnyTransition
            .push(from: .top)
            .animation(.easeInOut)
            .combined(with: .slide)
//            .combined(with: .opacity)
//            .combined(
//                with: .asymmetric(
//                    insertion: .move(edge: .top),
//                    removal: .move(edge: .bottom)
//                )
//            )
    }
}

struct ContentView: View {
    @State private var showDetails = false
    @State private var thirdRow = true

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                    thirdRow.toggle()
                }
            }

            if showDetails {
                Text("Move And Scale")
                    .transition(
                        .moveAndScale
                    )
            } else {
                Text("appear from leading, hide to trailing")
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .leading),
                            removal: .move(edge: .trailing)
                        )
                    )
            }
            
            if thirdRow {
                Text("Push And Slide")
                    .transition(
                        .pushAndSlide
                    )
            }
        }
    }
}

