//
//  MaterialTypeView.swift
//  VisionOS Course 05 Materials
//
//  Created by ClareZhou on 2024/7/9.
//

import SwiftUI
import RealityKit

struct MaterialTypeView: View {
    var body: some View {
        HStack{
            
            //3 Material Types: Simple, Unlit, Occlusion(bool -)
            
            
            //Material Settings
            RealityView{ content in
            let simpleMaterial1 = SimpleMaterial(color: .red, isMetallic: false)
            let cube1 = ModelEntity(
                mesh:.generateBox(size: 0.2, cornerRadius: 0.05),
                materials: [simpleMaterial1])
            content.add(cube1)
            }
            
            RealityView{ content in
            let simpleMaterial2 = SimpleMaterial(color: .red, isMetallic: true)
            let cube2 = ModelEntity(
                mesh:.generateBox(size: 0.2, cornerRadius: 0.05),
                materials: [simpleMaterial2])
            content.add(cube2)
            }
            
            //Unlit Material
            RealityView{ content in
                let unlitMaterial = UnlitMaterial(color: .red)
            let cube3 = ModelEntity(
                mesh:.generateBox(size: 0.2, cornerRadius: 0.05),
                materials: [unlitMaterial])
            content.add(cube3)
            }
            
            //Occlusion Model
            RealityView{ content in
                let simpleMaterial = SimpleMaterial(color: .red, roughness:0, isMetallic: true)
            let cube4 = ModelEntity(
                mesh:.generateBox(size: 0.2, cornerRadius: 0.05),
                materials: [simpleMaterial])
                
                //Occlusion [OcclusionMaterial()] and model Geo size
               let occlusionCube = ModelEntity(
                mesh:.generateBox(width: 0.1, height: 0.1, depth: 0.22),
                materials: [OcclusionMaterial()])
                
            content.add(cube4)
                content.add(occlusionCube)
            }
            
            
            /*
            //Cube1
            RealityView{ content, attachmentA in
                
                let simpleMaterial1 = SimpleMaterial(color: .red, isMetallic: false)
                if let modelA = try? await  ModelEntity(
                    mesh:.generateBox(size: 0.2, cornerRadius: 0.05),
                    materials: [simpleMaterial1]
                ){
                    modelA.position=[0,0,0]
                    content.add(modelA)
                    
                    if let modelATag = attachmentA.entity(for:"A"){
                        modelA.addChild(modelATag)
                        modelATag.position=[0,-0.15,0]
                    }
                }
            }
        attachments:{
            Attachment(id: "A"){
                Text("Simple Metalic Material")
                    .font(.title2)
                    .padding()
                    .glassBackgroundEffect()
            }
        }
        .padding()
            

            //Cube2
            RealityView{ content, attachmentB in
                
                let simpleMaterial2 = SimpleMaterial(color: .red, isMetallic: true)
                if let modelB = try? await  ModelEntity(
                    mesh:.generateBox(size: 0.2, cornerRadius: 0.05),
                    materials: [simpleMaterial2]
                ){
                    modelB.position=[0.5,0,0]
                    content.add(modelB)
                    
                    if let modelBTag = attachmentB.entity(for:"B"){
                        modelB.addChild(modelB)
                        modelBTag.position=[0.5,-0.15,0]
                    }
                }
            }
        attachments:{
            Attachment(id: "B"){
                Text("Simple Metalic Material")
                    .font(.title2)
                    .padding()
                    .glassBackgroundEffect()
            }
        }
            
            //Cube3
            RealityView{ content, attachmentC in
                
                let unLitMaterial = SimpleMaterial(color: .red, isMetallic: false)
                if let modelC = try? await  ModelEntity(
                    mesh:.generateBox(size: 0.2, cornerRadius: 0.05),
                    materials: [unLitMaterial]
                ){
                    content.add(modelC)
                    
                    if let modelCTag = attachmentC.entity(for:"C"){
                        modelC.addChild(modelCTag)
                        modelCTag.position=[0,-0.15,0]
                    }
                }
            }
        attachments:{
        Attachment(id: "C"){
            Text("Simple Metalic Material")
                .font(.title2)
                .padding()
                .glassBackgroundEffect()
        }
    }
            
            //Cube4
            RealityView{ content, attachmentD in
                
                let M4 = SimpleMaterial(color: .red, isMetallic: false)
                if let modelD = try? await  ModelEntity(
                    mesh:.generateBox(size: 0.2, cornerRadius: 0.05),
                    materials: [M4]
                ){
                    content.add(modelD)
                    
                    if let modelDTag = attachmentD.entity(for:"D"){
                        modelD.addChild(modelDTag)
                        modelDTag.position=[0,-0.15,0]
                    }
                }
            }
        attachments:{
    Attachment(id: "D"){
        Text("Simple Metalic Material")
            .font(.title2)
            .padding()
            .glassBackgroundEffect()
    }
}
             */
            
        }
    }
}

#Preview {
    MaterialTypeView()
}
