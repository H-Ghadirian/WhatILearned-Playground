//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

let view = ButtonAnimationContentView() //ContentView()
//let hostingVC = UIHostingController(rootView: view)
//PlaygroundPage.current.liveView = hostingVC
PlaygroundPage.current.setLiveView(
    view
        .frame(width: 500.0, height: 1000.0)
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

struct ButtonAnimationContentView: View {
    @State private var scale = 1.0
    @State private var angle = 0.0
    @State private var borderThickness = 1.0
    @State private var opacity = 1.0

    var body: some View {
        VStack {
            buttonWithScaleAnimation
            buttonWithRotationAnimation
            buttonWithOpacityAnimation
        }
    }

    var buttonWithScaleAnimation: some View {
        Button("Scale") {
            scale += 1
        }
        .scaleEffect(scale)
        .animation(.linear(duration: 1), value: scale)
    }

    var buttonWithRotationAnimation: some View {
        Button("Rotation") {
            angle += 45
            borderThickness += 1
        }
        .padding()
        .border(.red, width: borderThickness)
        .rotationEffect(.degrees(angle))
        .animation(.easeIn, value: angle)
    }

    var buttonWithOpacityAnimation: some View {
        Button("Opacity") {
            withAnimation {
                opacity -= 0.2
            }
        }
        .padding()
        .opacity(opacity)
    }
}
