import SwiftUI

public struct StateBindingView: View {
    @State private var name = "Hamed"

    public init() {}

    public var body: some View {
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
