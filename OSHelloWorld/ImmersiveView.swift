//
//  ImmersiveView.swift
//  Hello World
//
//  Created by Antonio Jimenez on 10/02/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            let floor = ModelEntity(mesh: .generatePlane(width: 50, depth: 50), materials: [OcclusionMaterial()])
            floor.generateCollisionShapes(recursive: false)
            floor.components[PhysicsBodyComponent.self] = .init(
                massProperties: .default,
                mode: .static
            )
            
            content.add(floor)
            
            if let appleModel = try? await Entity(named: "Apple_Reduced"), let apple = appleModel.children.first?.children.first {
                let scale: Float = 3
                apple.scale = [scale, scale, scale]
                apple.position.y = 0.5
                apple.position.z = -1
                
                apple.generateCollisionShapes(recursive: false)
                apple.components.set(InputTargetComponent())
                
                apple.components[PhysicsBodyComponent.self] = .init(PhysicsBodyComponent(
                    massProperties: .default,
                    material: .generate(staticFriction: 0.8, dynamicFriction: 0.5, restitution: 0.1),
                    mode: .dynamic))
                
                apple.components[PhysicsMotionComponent.self] = .init()
                
                content.add(apple)
            }
        }
        .gesture(dragGesture)
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .targetedToAnyEntity()
            .onChanged { value in
                debugPrint("onChanged")
                value.entity.position = value.convert(value.location3D, from: .local, to: value.entity.parent!)
                value.entity.components[PhysicsBodyComponent.self]?.mode = .kinematic
            }
            .onEnded { value in
                debugPrint("onEnded")
                value.entity.components[PhysicsBodyComponent.self]?.mode = .dynamic
            }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
