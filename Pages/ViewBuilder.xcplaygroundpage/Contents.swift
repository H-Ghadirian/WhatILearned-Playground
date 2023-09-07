//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

// https://www.swiftbysundell.com/articles/avoiding-anyview-in-swiftui/

let view = StateBindingView()
PlaygroundPage.current.setLiveView(
    view
        .frame(width: 500.0, height: 1000.0)
    //provide a width and hight of your choice
)

struct StateBindingView: View {
    @State private var name = "Hamed"

    var body: some View {
        VStack {
            Text(name)
            FolderInfoView(name: $name)
        }
    }
}

struct FolderInfoView: View {
    @State var isEditable = true
    @Binding var name: String

    var body: some View {
        HStack {
            Image(systemName: "folder")
            textView
        }
    }

    @ViewBuilder
    private var textView: some View {
        if isEditable {
            TextField("Name", text: $name)
        } else {
            Text(name)
        }
    }
}


//: [Next](@next)
