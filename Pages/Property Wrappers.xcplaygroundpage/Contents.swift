//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

let view = EnvironmentContentView()
PlaygroundPage.current.setLiveView(
    view
        .frame(width: 500.0, height: 1000.0)
    //provide a width and hight of your choice
)

struct StateView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Button {
                count += 1
            } label: {
                Text("\(count)")
            }
        }
    }
}

struct StateBindingView: View {
    @State private var intValue = 0

    var body: some View {
        VStack {
            Text("intValue equals \(intValue)")
            BindingView(intValue: $intValue)
        }
    }
}

struct BindingView: View {
    @Binding var intValue: Int

    var body: some View {
        Button("Increment") {
            intValue += 1
        }
    }
}

class CounterViewModel: ObservableObject {
    @Published var count = 0
}

struct CounterView: View {
    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
            Button("Increment") {
                viewModel.count += 1
            }
        }
    }
}

struct RandomNumberView: View {
    @State var randomNumber = 0

    var body: some View {
        VStack {
            Text("\(randomNumber)")
            Button("Random number") {
                randomNumber = (0..<1000).randomElement()!
            }
        }.padding(.bottom)
        CounterView()
    }
}

class Score: ObservableObject {
    @Published var count = 0
}

struct EnvironmentObjectView: View {
    @StateObject var score = Score()

    var body: some View {
        NavigationStack {
            VStack {
                Text("Incremented Score = \(score.count)")
                Button("Increment Counter") {
                    score.count += 1
                }
                NavigationLink {
                    EnvionmentDetailView()
                } label: {
                    Text("Show Detail View")
                }
            }
        }.environmentObject(score)
    }
}

struct EnvionmentDetailView: View {
    @EnvironmentObject var score: Score

    var body: some View {
        VStack {
            Button("Increment Counter") {
                score.count += 1
            }
            Text("Incremented Score = \(score.count)")
        }
    }
}

struct EnvironmentContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.calendar) private var calendar
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.locale) private var local

    var body: some View {
        VStack {
            Text(colorScheme == .dark ? "dark" : "light")
            Text(calendar.timeZone.description)
            Text(horizontalSizeClass.debugDescription)
            Text(local.description)
        }
    }
}

private struct AnalyticsCategoryEnvironmentKey: EnvironmentKey {
    static let defaultValue: String = "none"
}

extension EnvironmentValues {
    var analyticsCategory: String {
        get { self[AnalyticsCategoryEnvironmentKey.self] }
        set { self[AnalyticsCategoryEnvironmentKey.self] = newValue }
    }
}

// Setting the environment value.
//LoginView()
//    .environment(\.analyticsCategory, "login")

// Accessing the environment value.
struct LoginView: View {
    @Environment(\.analyticsCategory) var analyticsCategory: String

    var body: some View {
        Text(analyticsCategory)
    }
}

//: [Next](@next)
