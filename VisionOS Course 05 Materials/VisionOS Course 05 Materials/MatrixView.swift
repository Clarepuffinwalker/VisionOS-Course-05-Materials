//
//  MatrixView.swift
//  VisionOS Course 05 Materials
//
//  Created by ClareZhou on 2024/7/9.
//

import SwiftUI
import RealityKit

struct MatrixView: View {
    private let radius: Float = 0.04
    private let interval: Float = 0.1
    private let initPosition = SIMD3<Float>(x: -0.2, y: -0.4, z: 0)
    private let matrixSize = 5
    
    var outerEntity = Entity()
    
    var body: some View {
        RealityView { content in
            for roughness in 0...matrixSize {
                for metallic in 0...matrixSize {
                    for opacity in 0...matrixSize {
                        let r = Float(roughness)
                        let m = Float(metallic)
                        let o = Float(opacity)
                        let xOffset = interval * r
                        let yOffset = interval * m
                        let zOffset = interval * o
                        let position = SIMD3<Float>(x: initPosition.x + xOffset, y: initPosition.y + yOffset, z: initPosition.z + zOffset)
                        
                        var material = PhysicallyBasedMaterial()
                        material.baseColor = PhysicallyBasedMaterial.BaseColor(tint:.orange)
                        material.roughness = PhysicallyBasedMaterial.Roughness(floatLiteral: 0.2 * r)
                        material.metallic = PhysicallyBasedMaterial.Metallic(floatLiteral: 0.2 * m)
                        material.blending = .transparent(opacity: .init(floatLiteral: 0.2 * o))
                        
                        let sphere = ModelEntity(
                            mesh: .generateSphere(radius: radius),
                            materials: [material],
                            collisionShape: .generateSphere(radius: radius),
                            mass: 0.0
                        )
                        sphere.components.set(InputTargetComponent(allowedInputTypes: .indirect))
                        sphere.components.set(HoverEffectComponent())
                        
                        // If you want FULL transparency, use OpacityComponent
                        // var op = OpacityComponent()
                        // sphere.components.set(OpacityComponent())
                        
                        sphere.position = position
                        outerEntity.addChild(sphere)
                    }
                }
            }
            content.add(outerEntity)
        }
    }
}

#Preview {
    MatrixView()
}
