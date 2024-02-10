//
//  ContentView.swift
//  OSHelloWorld
//
//  Created by Antonio Jimenez on 10/02/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            Text("🍎")
                .foregroundStyle(.yellow)
                .font(.custom("Menlo", size: 100))
                .bold()
        }
        .padding()
        .task {
            await openImmersiveSpace(id: "ImmersiveSpace")
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
