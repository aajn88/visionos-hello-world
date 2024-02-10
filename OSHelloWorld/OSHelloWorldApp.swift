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

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
