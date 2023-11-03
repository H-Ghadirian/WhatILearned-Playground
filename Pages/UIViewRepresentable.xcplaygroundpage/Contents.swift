//: [Previous](@previous)

import Foundation
import SwiftUI
import UIKit
import PlaygroundSupport

let view = ContentView()
PlaygroundPage.current.setLiveView(
    view
        .frame(width: 500.0, height: 500.0)
    //provide a width and hight of your choice
)

struct TextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
    }
}

struct ContentView: View {
    @State var text = NSMutableAttributedString(string: "Hallo")

    var body: some View {
        VStack {
//            Text(text.string) // TODO: Doesn't work!
            Spacer()
            TextView(text: $text)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        
    }
}

//: [Next](@next)
