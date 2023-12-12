//
//  ContentView.swift
//  swiftui-pinch-and-zoom-app-ios16
//
//  Created by Stanislav Ponomarenko on 2023-12-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
