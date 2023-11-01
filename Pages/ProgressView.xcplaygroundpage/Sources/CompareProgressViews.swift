import SwiftUI

public struct CompareProgressViews: View {
    public init() {}
    public var body: some View {
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
