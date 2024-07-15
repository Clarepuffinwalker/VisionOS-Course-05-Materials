//
//  SkyboxView.swift
//  VisionOS Course 05 Materials
//
//  Created by ClareZhou on 2024/7/9.
//

import SwiftUI
import RealityKit

struct SkyboxView: View {
    //skybox var settings
    @State private var skybox = Entity()
    
    var body: some View {
        RealityView { content in
            
            //IBL Image Settings, just for light
            //IBL var settings
            guard let environment = try? await EnvironmentResource(named:"Sunset")
            else {
                print("Unable to find IBL image")
                return
        }
            //Skybox Settings, for texture and shape
            //Orignal UnlitMaterial Settings
            guard let resource = try? await TextureResource(named: "Sunset") else {
                print("Unable to load texture")
                return
            }
            var SkyboxOrignalMaterial = UnlitMaterial()
            SkyboxOrignalMaterial.color = .init(texture: .init(resource))
            //Skybox Sphere,x needs to be set as -1, for Mterial showing inside sphere, not out
            skybox.components.set(ModelComponent(
                mesh: .generateSphere(radius: 1000), materials: [SkyboxOrignalMaterial]))
            skybox.scale = .init(x: -1 * abs(skybox.scale.x),y:skybox.scale.y, z:skybox.scale.z )
            content.add(skybox)
            
            //Receiver Settings
            //1st
            let sphere1 = ModelEntity(
                mesh:.generateSphere(radius: 1.0),
                materials:[SimpleMaterial(color: .lightGray, isMetallic: false)]
            )
            sphere1.position = [-5,0,0]
            content.add(sphere1)
            
            //Object IBL Light Resource Settings
            sphere1.components.set(ImageBasedLightComponent(source:.single(environment), intensityExponent: 2.0))
            //Object Receiver Settings
            sphere1.components.set(ImageBasedLightReceiverComponent(imageBasedLight: sphere1))
            
            
            //2nd
            let sphere2 = ModelEntity(
                mesh:.generateSphere(radius: 1.0),
                materials:[SimpleMaterial(color: .lightGray, isMetallic: true)]
            )
            sphere2.position = [0,0,0]
            content.add(sphere2)

            sphere2.components.set(ImageBasedLightComponent(source:.single(environment), intensityExponent: 2.0))
            sphere2.components.set(ImageBasedLightReceiverComponent(imageBasedLight: sphere2))
            
            //Debugger, check resourcelist
                let bundle = Bundle.main
                if let resourcePath = bundle.resourcePath {
                    do {
                        let contents = try FileManager.default.contentsOfDirectory(atPath: resourcePath)
                        print("Bundle Contents: \(contents)")
                    } catch {
                        print("Failed to list bundle contents: \(error.localizedDescription)")
                    }
            }//debugger ends
            
        }
    }
}

#Preview {
    SkyboxView()
}
