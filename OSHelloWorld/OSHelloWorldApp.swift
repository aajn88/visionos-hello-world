//
//  OSHelloWorldApp.swift
//  OSHelloWorld
//
//  Created by Antonio Jimenez on 10/02/2024.
//

import SwiftUI

@main
struct OSHelloWorldApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 100, height: 100)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
